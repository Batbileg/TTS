ARG BASE=nvidia/cuda:11.8.0-base-ubuntu22.04
FROM ${BASE}
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends gcc g++ make python3 python3-dev python3-pip python3-venv python3-wheel espeak-ng libsndfile1-dev && rm -rf /var/lib/apt/lists/*
RUN pip3 install llvmlite --ignore-installed
RUN pip3 install gevent

WORKDIR /root
COPY . /root
COPY torch-2.0.0+cu118-cp310-cp310-linux_x86_64.whl /root
# COPY torchaudio-0.11.0+cpu-cp310-cp310-linux_x86_64.whl /root
# RUN pip3 install torch-2.0.0+cu118-cp310-cp310-linux_x86_64 && pip3 install torchaudio-0.11.0+cpu-cp310-cp310-linux_x86_64.whl
RUN pip3 install torch-2.0.0+cu118-cp310-cp310-linux_x86_64.whl
# RUN pip3 install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu118
RUN pip3 install torchaudio --extra-index-url https://download.pytorch.org/whl/cu118
RUN make install
ENTRYPOINT ["tts"]
CMD ["--help"]
RUN rm torch*.whl
