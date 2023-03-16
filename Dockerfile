# Set the base image to use
FROM python:3.9

WORKDIR /app

# Copy SSL certificate and key into container
COPY privkey.pem /etc/ssl/private/
COPY fullchain.pem /etc/ssl/certs/

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the container
COPY . .

# Set the environment variables for the SSL certificate paths
ENV SSL_KEY_FILE=../../archive/proshtor.com-0001/privkey.pem
ENV SSL_CERT_FILE=../../archive/proshtor.com-0001/fullchain1.pem

# Expose port 80 for the Flask application
EXPOSE 80
EXPOSE 443

# Set the command to run when the container starts
CMD ["python", "app.py"]

COPY --chown=root:root fullchain.pem /etc/ssl/certs/
