FROM ubuntu:latest

RUN apt-get update && apt-get -qq install -y sudo bash
RUN cat /etc/sudoers
RUN groupadd admin

RUN useradd -m  ubuntu -G admin && echo "ubuntu:ubuntu" | chpasswd
WORKDIR /home/ubuntu

COPY . ./current 
RUN chown -R ubuntu:ubuntu ./current

USER ubuntu

CMD ["bash"]
