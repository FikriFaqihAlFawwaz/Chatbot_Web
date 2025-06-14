Certainly! Here's the updated README with a **"How to Run"** section added:

---

# AI Chatbot with Gemini Integration 🚀🤖

Welcome to the **AI Chatbot** project! This chatbot is not just any ordinary bot—it's powered by cutting-edge **AI models**, including the **Gemini 1.5-flash** model from Google, making it incredibly smart and interactive. Whether you're looking for quick answers, coding help, or insightful information from your PDFs, this chatbot has got you covered! 🌟

## ✨ Key Features

* **Intelligent Chat Experience**: Choose between **Gemini-1.5-flash** or a custom-trained **API-Iqbal** model to get tailored responses.
* **PDF Upload & Query**: Upload your PDF documents 📑, extract the content, and ask the chatbot to provide insightful answers based on the document.
* **History Retrieval**: Never lose track of your conversations! 🕰️ Retrieve chat history based on your selected prompt and continue from where you left off.
* **User Authentication**: Stay secure with **login**, **registration**, and **password hashing**. Personalized features for logged-in users.
* **Modern UI**: Clean, **responsive design** with TailwindCSS, optimized for both desktop and mobile devices. 💻📱
* **Collapsible Sidebar**: Navigate seamlessly with the interactive sidebar that expands or collapses based on your preference. 🗂️

## ⚙️ Tech Stack

* **Backend**: Flask (Python) 💻
* **AI Integration**: **Gemini 1.5-flash** from Google & Custom LLM Model 🌐
* **Database**: MySQL 🗄️
* **PDF Processing**: PyMuPDF (fitz) 📝
* **Frontend**: HTML, CSS (TailwindCSS), JavaScript (jQuery) 🌈
* **Authentication**: Flask Sessions & werkzeug security 🔒


## 🏃 How to Run the Application

Once you've set up the project and the dependencies, here's how you can run the chatbot application:

### 1. **Start the Flask Development Server**:

You can run the Flask app by executing the following command:

```bash
python app.py
```

This will start the server on `http://localhost:5000` (the default Flask address).

### 2. **Access the Application**:

Open a web browser and go to `http://localhost:5000` where the chatbot interface will be available.

### 3. **Interact with the Chatbot**:

* **Chat**: Choose between **API-Iqbal** or **Gemini-1.5-flash** as the AI model, and enter your message and prompt.
* **Upload PDFs**: Upload a PDF document, and the chatbot will extract and make the contents available for querying.
* **User Authentication**: Log in to save and access your previous chat history.

### 4. **Optional: Use the API Endpoints**:

If you prefer interacting with the app programmatically, here are the available endpoints:

* **POST /chat/general/**: For general chat.
* **POST /coder/coder/**: For coding-specific queries.
* **POST /rag/upload/**: To upload files for RAG processing.
* **POST /pdf/upload**: To upload PDFs and extract text for querying.
* **GET /load\_history**: Retrieve your chat history.
* **GET /load\_history\_by\_prompt**: Retrieve chat history based on a specific prompt.

---

## 💬 How to Use

### Chat with the AI 🤖

* **Select Model**: Choose between **API-Iqbal** or **Gemini-1.5-flash**.
* **Enter Prompt & Message**: Type in your question or request and hit **Send**.
* **Receive Response**: The AI will provide you with a response based on the selected model.

### Upload PDF 📑

* **Extract Text**: Upload a PDF document, and the bot will extract the text content.
* **Ask Questions**: Query the bot for answers based on the extracted text.

### View Chat History 🕰️

* **Search by Prompt**: Choose a specific prompt and view the chat history tied to that prompt.
* **Click to View**: Click on any conversation in the history to load it and continue the discussion.

### User Authentication 🔐

* **Register/Login**: Users can create an account or log in to access personalized features and chat history.
* **Secure Login**: Passwords are hashed for security.

## 🚀 API Endpoints

* **POST /chat/general/**: Chat with the selected AI model.
* **POST /coder/coder/**: For coding queries.
* **POST /rag/upload/**: Upload files for RAG processing.
* **POST /pdf/upload**: Upload PDF files and extract text for RAG chat.
* **GET /load\_history**: Get the chat history for the logged-in user.
* **GET /load\_history\_by\_prompt**: Fetch chat history by prompt title.
* **GET /register**: User registration.
* **GET /login**: User login.
* **GET /logout**: Log out and end the session.

## 📖 Example Chatbot Flow

1. **Start the Chat**: Select the AI model and input your prompt and message.
2. **Receive AI Response**: Get an intelligent answer based on the selected model.
3. **Retrieve Chat History**: Look back at previous conversations with ease by clicking on a specific prompt.

## 👩‍💻 Contributing

We love contributions! Fork the repository, make your changes, and submit a pull request. Help us make this chatbot even smarter! 🌟

## 🧑‍🏫 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Author**: Your Name
**GitHub**: [Your GitHub Profile](https://github.com/yourusername)
**Email**: [your.email@example.com](mailto:your.email@example.com)

---

🔥 Ready to chat with the smartest AI out there? 🚀 Try it out now and explore endless possibilities with the power of generative AI!

---

This section provides step-by-step instructions on how to run the app locally. It gives clarity on starting the Flask server and accessing the chatbot.
