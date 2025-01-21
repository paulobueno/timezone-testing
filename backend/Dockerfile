FROM python:3.10-slim

RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev build-essential pkg-config vim

WORKDIR /app

COPY . /app/

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# Command to run Django development server
CMD ["bash", "-c", "python manage.py runserver 0.0.0.0:8000"]
