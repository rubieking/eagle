FROM ubuntu
RUN apt-get -y update && apt-get -y install curl python3 python3-venv vim wget

RUN apt-get -y update && apt-get -y install git
RUN apt-get -y update && apt-get -y install xdg-utils xz-utils
RUN apt-get -y update && apt-get -y install libopengl0
RUN apt-get -y update && apt-get -y install libxcb-cursor0
RUN wget -O /tmp/calibre-install https://download.calibre-ebook.com/linux-installer.sh && bash /tmp/calibre-install && rm /tmp/calibre-install
RUN apt-get -y update && apt-get -y install libnss3

ADD docker/scripts/bashrc.local /root/.bashrc.local
RUN echo source /root/.bashrc.local >> /root/.bashrc
