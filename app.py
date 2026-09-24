from flask import Flask
import os
import socket

app = Flask(__name__)

@app.route("/")
def home():
    version = os.getenv("APP_VERSION", "v1")
    return f"Hi from {socket.gethostname()} - version {version}\n"

@app.route("/health")
def health():
    return "ok\n", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)