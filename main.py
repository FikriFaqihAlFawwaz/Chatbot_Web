from api.server import app
from dotenv import load_dotenv
import uvicorn

load_dotenv()

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)