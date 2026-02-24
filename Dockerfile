# Use slim base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first (layer caching best practice)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY app/ .

# Expose port
EXPOSE 8000

# Set environment variable
ENV MODEL_VERSION=v1

# Run application
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]