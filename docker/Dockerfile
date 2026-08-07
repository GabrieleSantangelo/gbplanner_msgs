FROM ros:jazzy

RUN apt-get update && apt-get install -y \
    build-essential \
    python3 python3-dev python3-pip \
    python3-venv \
    python3-tk \
    software-properties-common


RUN python3 -m venv --system-site-packages /opt/venv

RUN echo 'source /opt/venv/bin/activate' >> ~/.bashrc
RUN echo 'source /opt/ros/jazzy/setup.bash' >> ~/.bashrc

WORKDIR /workspace

CMD ["bash"]