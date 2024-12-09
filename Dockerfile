# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements_dev.txt
RUN pip install --no-cache-dir -r requirements_dev.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV FLASK_APP=flaskapp.py

# Run flaskapp.py when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "flaskapp:app"]