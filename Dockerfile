FROM ubuntu:latest

ENV SHELL bash
ENV DEBIAN_FRONTEND noninteractive

RUN useradd test
RUN usermod -aG sudo test
RUN mkdir /home/test
RUN chown test:test -R /home/test

RUN apt-get update
RUN apt-get install -y \
  ack-grep \
  fzf \
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

COPY --chown=test:test bash dotfiles/bash
COPY --chown=test:test git dotfiles/git
COPY --chown=test:test local dotfiles/local
COPY --chown=test:test postgres dotfiles/postgres
COPY --chown=test:test rubygems dotfiles/rubygems
COPY --chown=test:test tmux dotfiles/tmux
COPY --chown=test:test vim dotfiles/vim
COPY --chown=test:test X dotfiles/X
COPY --chown=test:test install dotfiles

# RUN cd dotfiles && ./install

CMD ["bash"]
