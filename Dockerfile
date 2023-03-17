# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy SSL certificate and private key into the container
COPY cert.pem .
COPY key.pem .

# Expose ports 80 and 443 for HTTP and HTTPS traffic
EXPOSE 80
EXPOSE 443

# Run the app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "--keyfile", "key.pem", "--certfile", "cert.pem", "run:app"]