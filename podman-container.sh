#!/bin/bash

# Pull the Docker image
podman pull --platform linux/amd64 nvidia/cuda:11.8.0-base-ubuntu22.04

# Create and start the container
podman run --platform linux/amd64 --name mod-tts --rm nvidia/cuda:11.8.0-base-ubuntu22.04 bash -c "apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends gcc g++ make python3 python3-dev python3-pip python3-venv python3-wheel espeak-ng libsndfile1-dev && rm -rf /var/lib/apt/lists/* && pip3 install llvmlite --ignore-installed && pip3 install gevent && mkdir /root && cd /root && make install && tts --help"
