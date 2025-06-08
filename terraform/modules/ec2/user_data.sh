#!/bin/bash
sudo apt update -y
sudo apt install -y python3-pip
pip3 install fastapi uvicorn[standard]

# Create a FastAPI app file
cat <<EOF > /home/ubuntu/app.py
from fastapi import FastAPI
app = FastAPI()

@app.get("/health")
def read_root():
    return {"message": "LLM API is running"}
EOF

# Run FastAPI app in background
nohup uvicorn app:app --host 0.0.0.0 --port 80 &
