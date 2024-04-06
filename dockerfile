# Use the official Python base image
FROM python:3.11-slim-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Update package list and install system dependencies
RUN apt-get update && \
    apt-get install -y pkg-config default-libmysqlclient-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container at /app/requirements.txt
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code into the container at /app/
COPY . /app/

# Expose port
EXPOSE 8000

# Entry point and command
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]