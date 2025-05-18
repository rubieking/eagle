FROM ubuntu
RUN apt-get -y update && apt-get -y install curl python3 python3-venv vim wget

RUN apt-get -y update && apt-get -y install pipx git
RUN pipx install git+https://github.com/openai/whisper.git
RUN export PATH="$PATH:/root/.local/bin"

ADD docker/scripts/bashrc.local /root/.bashrc.local
RUN echo source /root/.bashrc.local >> /root/.bashrc
