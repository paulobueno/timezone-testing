FROM python:3.10-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev build-essential pkg-config vim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file (if it exists)
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Create the Django project if it doesn't exist
RUN django-admin startproject timezone . || true

# Expose the Django development server port
EXPOSE 8000

# Command to run Django development server
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
