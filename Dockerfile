FROM ubuntu:latest

ENV SHELL bash
ENV DEBIAN_FRONTEND noninteractive

RUN useradd test
RUN usermod -aG sudo test
RUN mkdir /home/test
RUN chown test:test -R /home/test

RUN apt-get update
RUN apt-get install -y ack-grep \
  vim \
  curl \
  git \
  lsof \
  unzip \
  build-essential \
  bash \
  cargo \
  stow \
  tmux \
  python3 \
  python3-pip \
  rustc

USER test

WORKDIR /home/test

RUN cargo install --locked bat
RUN cargo install exa

RUN curl -fsSL https://fnm.vercel.app/install | bash

RUN mkdir /home/test/dotfiles

COPY bash dotfiles/bash
COPY git dotfiles/git
COPY local dotfiles/local
COPY postgres dotfiles/postgres
COPY rubygems dotfiles/rubygems
COPY tmux dotfiles/tmux
COPY vim dotfiles/vim
COPY X dotfiles/X
COPY install dotfiles

RUN cd dotfiles && ./install

CMD ["bash"]
