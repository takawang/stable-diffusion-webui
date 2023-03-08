#!/bin/bash

# Set container and image names
CONTAINER_NAME="stable-diffusion"
IMAGE_NAME="pytorch/pytorch:1.13.1-cuda11.1-cudnn8-runtime"

## ----- Build script ---- ##

# # Run the container with necessary configurations
# docker run -v $PWD:/app --name=temp-sd --network host --rm -it --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 $IMAGE_NAME /bin/bash

# # Inside the container, update and install necessary dependencies
# apt-get update && apt-get install -y git libgl1 libglib2.0-0
# export PATH=/usr/local/cuda/bin:$PATH
# cd /app
# pip install markupsafe==2.0.1 Werkzeug==2.1.0 fastapi ninja

# # Start the web UI and make sure it's accessible
# ./webui-docker.sh --listen --enable-insecure-extension-access --xformers

# # Stop the container using `ctrl+c` and save the container state
# docker commit temp-sd $CONTAINER_NAME

## ----- Run script ---- ##

# Run the container with necessary configurations
docker run -v $PWD:/app --network host --rm -it --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 $CONTAINER_NAME /bin/bash

# Inside the container, go to the working directory and start the web UI
# cd /app
# python3 webui.py --listen --enable-insecure-extension-access --xformers
