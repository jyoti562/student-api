from flask import Flask, jsonify
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)

@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "ok",
        "environment": os.getenv("ENV")
    })

if __name__ == "__main__":
    app.run(debug=True)
