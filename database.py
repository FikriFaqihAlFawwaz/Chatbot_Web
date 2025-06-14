import mysql.connector


# MySQL database connection
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

def save_chat(user_message, bot_response, user_id, prompt):
    try:
        conn = get_db_connection()
        if conn:
            cursor = conn.cursor()

            # Save the message without the theme column
            cursor.execute("""
                INSERT INTO chat_history (user_id, user_message, bot_response, prompt, created_at)
                VALUES (%s, %s, %s, %s, NOW())
            """, (user_id, user_message, bot_response, prompt))

            conn.commit()
            cursor.close()
            conn.close()
            print("Chat saved successfully!")
        else:
            print("Database connection failed!")
    except Exception as e:
        print(f"Error saving chat: {e}")
        

def save_uploaded_file(user_id, filename, filepath):
    try:
        conn = get_db_connection()
        if conn:
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO uploaded_files (user_id, filename, filepath, uploaded_at)
                VALUES (%s, %s, %s, NOW())
            """, (user_id, filename, filepath))
            conn.commit()
            cursor.close()
            conn.close()
            print("Uploaded file metadata saved successfully.")
    except Exception as e:
        print(f"Error saving uploaded file metadata: {e}")


def get_chat_history(user_id, prompt):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        # Retrieve chat history for a specific user and prompt
        cursor.execute("""
            SELECT user_message, bot_response, created_at, prompt 
            FROM chat_history 
            WHERE user_id = %s AND prompt = %s
            ORDER BY created_at ASC
        """, (user_id, prompt))

        chat_history = cursor.fetchall()
        cursor.close()
        conn.close()

        return chat_history
    except Exception as e:
        print(f"Error retrieving chat history: {e}")
        return []  # Return empty list on error
    
    

