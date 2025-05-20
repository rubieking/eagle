FROM ubuntu
RUN apt-get -y update && apt-get -y install curl python3 python3-venv vim wget

RUN apt-get -y update && apt-get -y install git
RUN wget -O /tmp/calibre-install https://download.calibre-ebook.com/linux-installer.sh && bash /tmp/calibre-install && rm /tmp/calibre-install

ADD docker/scripts/bashrc.local /root/.bashrc.local
RUN echo source /root/.bashrc.local >> /root/.bashrc
