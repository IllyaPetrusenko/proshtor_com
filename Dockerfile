# Set the base image to use
FROM python:3.9

WORKDIR /app

# Copy SSL certificate and key into container
COPY fullchain1.pem .
COPY privkey1.pem .

# Copy the requirements file to the container
COPY requirements.txt .

# Set the environment variables for the SSL certificate paths
ENV SSL_KEY_FILE=privkey1.pem
ENV SSL_CERT_FILE=fullchain1.pem

# Install the Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the container
COPY . .

# Expose port 80 for the Flask application
EXPOSE 80
EXPOSE 443

# Set the command to run when the container starts
CMD ["python", "run.py"]