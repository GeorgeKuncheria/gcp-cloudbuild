# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables (fixed format - no spaces around =)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

# Set the working directory in the container
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose the port
EXPOSE $PORT

# Use gunicorn as production server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "4", "run:app"]