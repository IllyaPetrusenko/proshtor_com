# Set the base image to use
FROM python:3.9

# Set the working directory inside the container
WORKDIR /application

# Copy SSL certificate and key into container
ADD fullchain.pem ssl/fullchain.pem
ADD privkey.pem ssl/privkey.pem

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
CMD ["python", "run.py", "--port", "80", "gunicorn", "--certfile=ssl/fullchain.pem", "--keyfile=ssl/privkey.pem", "-w", "4", "-b", "0.0.0.0:443", "app:app"]