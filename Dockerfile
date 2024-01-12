FROM python:3.10.12-bullseye

RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y \
    build-essential \
    swig \
    cmake

# Copy the current directory contents into the container at /home/TrainingNLPinContainer (do not use home alone)
COPY . /home/TrainingNLPinContainer

# Set the working directory to /home/TrainingNLPinContainer
WORKDIR /home/TrainingNLPinContainer

# Install any additional dependencies you need 
RUN pip install -r requirements.txt 

# Install local folder as Python module (will use setup.py from local folder, here WORKDIR or /home/RL_Connect4)
RUN pip install -e .