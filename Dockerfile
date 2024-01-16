FROM python:3.10.12-bullseye

# Create a non-root user and set the working directory
RUN useradd -m myuser
USER myuser
WORKDIR /home/myuser

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    swig \
    cmake

# Copy the current directory contents into the container at /home/myuser/TrainingNLPinContainer
COPY --chown=myuser:myuser . /home/myuser/TrainingNLPinContainer

# Set the working directory to /home/myuser/TrainingNLPinContainer
WORKDIR /home/myuser/TrainingNLPinContainer

# Install any additional dependencies you need 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt 

# Install local folder as Python module (will use setup.py from local folder, here)
RUN pip install -e .

# Switch back to the non-root user
USER myuser