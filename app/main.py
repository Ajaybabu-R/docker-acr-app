from fastapi import FastAPI
import os

app = FastAPI()

MODEL_VERSION = os.getenv("MODEL_VERSION", "v1")

@app.get("/")
def read_root():
    return {
        "message": "Hello World v2 🚀",
        "model_version": MODEL_VERSION
    }

@app.get("/health")
def health_check():
    return {"status": "healthy"}