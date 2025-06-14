import os
import mysql.connector
import google.generativeai as genai
import openai
from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from werkzeug.security import generate_password_hash, check_password_hash
import fitz  # PyMuPDF (for PDF text extraction)
import datetime

# Importing your models
from models import llm, vector_store
from database import save_chat, get_chat_history, save_uploaded_file
from api.endpoints.rag import upload_files

# Configure Gemini model (Model 2)
genai.configure(api_key="AIzaSyCcWXytihpqgyyrEVIzbdboJhqc209GFyQ")
gemini_model = genai.GenerativeModel('gemini-1.5-flash')

def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",  # your MySQL username
            password="",  # your MySQL password
            database="chatbot"  # your MySQL database name
        )
        return conn
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None
    
app = Flask(__name__)
app.secret_key = os.urandom(24)

@app.errorhandler(404)
def page_not_found(e):
    return redirect(url_for('index'))

@app.route('/chat/general/', methods=['POST'])
def general_chat():
    try:
        query = request.json.get('query')
        model_name = request.json.get('model_name')
        response = llm.chat(query, model=model_name)
        return jsonify({"response": response, "model": model_name})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/coder/coder/', methods=['POST'])
def coder_chat():
    try:
        query = request.json.get('query')
        model_name = request.json.get('model_name')
        response = llm.code_chat(query, model=model_name)
        return jsonify({"response": response, "model": model_name})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/rag/upload/', methods=['POST'])
def rag_upload():
    try:
        files = request.files.getlist('files')
        skip_duplicates = request.form.get('skip_duplicates', 'false') == 'true'
        results = upload_files(files, skip_duplicates)
        return jsonify({"results": results})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/pdf/upload', methods=['POST'])
def chat_pdf():
    try:
        file = request.files['file']
        if file and file.filename.endswith('.pdf'):
            temp_path = os.path.join("uploads", file.filename)
            file.save(temp_path)
            doc = fitz.open(temp_path)
            pdf_text = "".join(page.get_text() for page in doc)
            return jsonify({"status": "success", "extracted_text": pdf_text})
        else:
            return jsonify({"status": "error", "message": "Invalid file format. Only PDF files are allowed."}), 400
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route('/chat-pdf', methods=['GET', 'POST'])
def chat_pdf_page():
    if request.method == 'POST':
        try:
            file = request.files['file']
            if file and file.filename.endswith('.pdf'):
                filename = file.filename
                save_dir = "uploads"
                os.makedirs(save_dir, exist_ok=True)
                temp_path = os.path.join(save_dir, filename)
                file.save(temp_path)

                # Extract PDF text
                doc = fitz.open(temp_path)
                pdf_text = "".join(page.get_text() for page in doc)
                session['extracted_text'] = pdf_text  # simpan untuk dipakai di chatbot RAG

                # Save file metadata to DB
                user_id = session.get('user_id')  # if user is logged in
                save_uploaded_file(user_id, filename, temp_path)

                return render_template('chat_pdf.html', extracted_text=pdf_text)
            else:
                flash('Only PDF files are allowed!', 'danger')
                return redirect(url_for('chat_pdf_page'))
        except Exception as e:
            flash(f'An error occurred: {e}', 'danger')
            return redirect(url_for('chat_pdf_page'))
    return render_template('chat_pdf.html', extracted_text=None)

@app.route('/chat-pdf-rag', methods=['POST'])
def chat_pdf_rag():
    try:
        question = request.form.get('prompt')  # atau 'message'
        context = session.get('extracted_text', '')
        if not context:
            return jsonify({'response': "No PDF context loaded. Please upload a PDF first."})

        # Format prompt untuk RAG
        prompt_rag = f"Berikut adalah isi dokumen PDF:\n\n{context}\n\nPertanyaanku: {question}\n\nJawab berdasarkan informasi yang relevan dari dokumen ini."

        # Gunakan Gemini untuk menjawab
        response = gemini_model.generate_content(prompt_rag)
        return jsonify({'response': response.text})
    
    except Exception as e:
        return jsonify({'response': f"Error: {e}"}), 500



@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
        try:
            user_prompt = request.form.get('prompt', '').strip()  # Prompt entered by the user
            user_message = request.form.get('message', '').strip()  # User's input message

            # Ensure both prompt and message are present
            if not user_prompt or not user_message:
                return jsonify({'response': "Input cannot be empty."})

            selected_model = request.form.get('model', 'model1')

            # Get bot response based on selected model
            if selected_model == 'model2':
                response = gemini_model.generate_content(contents=user_message)
                bot_reply = response.text if response else "Sorry, but Gemini didn't want to answer that!"
            else:
                bot_reply = llm.predict(user_message)

            # Now pass both user_message and user_prompt (prompt) to save_chat without theme
            user_id = session.get('user_id')
            if user_id:
                # Saving chat without the theme
                save_chat(user_message, bot_reply, user_id, user_prompt)

            return jsonify({'response': bot_reply})
        except Exception as e:
            return jsonify({'response': f"An error occurred: {e}"})
    return render_template('index.html')


@app.route('/load_history', methods=['GET'])
def load_history():
    try:
        user_id = session.get('user_id')  # Get user_id from session
        if not user_id:
            return jsonify({"error": "User  not logged in."}), 401  # Return error if user is not logged in
        
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT user_message, bot_response, timestamp FROM chat_history WHERE user_id = %s ORDER BY timestamp ASC", (user_id,))
        history = cursor.fetchall()
        conn.close()

        return jsonify({"history": history})
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/load_history_by_prompt', methods=['GET'])
def load_history_by_prompt():
    try:
        user_id = session.get('user_id')
        if not user_id:
            return jsonify({"error": "User not logged in."}), 401  # If no user is logged in, return an error

        prompt = request.args.get('prompt')  # Get the prompt from the query string
        if not prompt:
            return jsonify({"error": "No prompt specified."}), 400  # If no prompt is provided, return an error

        print(f"Loading history for user_id: {user_id}, prompt: {prompt}")  # Debugging line
        
        # Retrieve chat history from the database for the given user and prompt
        history = get_chat_history(user_id, prompt)

        if not history:
            return jsonify({"error": "No history found for the selected prompt."}), 404  # If no history is found for that prompt

        print(f"History found: {history}")  # Debugging line
        
        # Return the history as a JSON response, with prompt titles
        history_titles = [entry['prompt'] for entry in history]
        return jsonify({"history_titles": history_titles, "history": history})

    except Exception as e:
        print(f"Error: {e}")  # Debugging line
        return jsonify({"error": str(e)}), 500

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        hashed_password = generate_password_hash(password)
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        existing_user = cursor.fetchone()
        if existing_user:
            flash('Email already exists!', 'danger')
        else:
            cursor.execute("INSERT INTO users (email, password) VALUES (%s, %s)", (email, hashed_password))
            conn.commit()
            flash('You have successfully registered!', 'success')
            return redirect(url_for('login'))
        conn.close()
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()
        if user and check_password_hash(user[2], password):
            session['user_id'] = user[0]  # Ensure user ID is stored in session
            session['email'] = user[1]
            session['name'] = user[4]
            session['avatar'] = "https://placehold.co/40x40"
            print("User  ID stored in session:", session['user_id'])  # Debugging line
            return redirect(url_for('index'))
        else:
            flash('Invalid email or password', 'danger')
        conn.close()
    return render_template('login.html')


@app.route('/logout')
def logout():
    # Clear the session data
    session.clear()
    # Redirect the user to the login page or home page
    return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)
