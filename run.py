from flask import Flask
from dotenv import load_dotenv
import os

load_dotenv()


app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World! This is a simple Flask app running on port 8080."

if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))  # Default to 5000 if not set
    app.run(host='0.0.0.0', port=port, debug=True)