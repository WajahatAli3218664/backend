FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY ragbot-api/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the backend code
COPY ragbot-api/ragbot_api ./ragbot_api

# Expose port (optional)
EXPOSE 8000

# Start the FastAPI app using uvicorn (Render will set $PORT)
CMD ["uvicorn", "ragbot_api.main:app", "--host", "0.0.0.0", "--port", "$PORT"]
