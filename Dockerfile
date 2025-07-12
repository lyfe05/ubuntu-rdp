FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y sudo xfce4 xfce4-goodies xrdp wget curl && \
    apt clean

RUN useradd -m -s /bin/bash rdpuser && \
    echo 'rdpuser:123456' | chpasswd && \
    adduser rdpuser sudo

RUN echo "xfce4-session" > /home/rdpuser/.xsession && \
    chown rdpuser:rdpuser /home/rdpuser/.xsession

EXPOSE 3389

CMD service xrdp start && tail -f /dev/null
