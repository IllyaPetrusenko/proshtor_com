# Set the base image to use
FROM python:3.9

WORKDIR /app

# Copy SSL certificate and key into container
COPY fullchain1.pem .
COPY privekey1.pem .

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the container
COPY . .

# Expose port 80 for the Flask application
EXPOSE 80
EXPOSE 443

# Set the command to run when the container starts
CMD ["python", "app.py"]