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
  rustc

USER test

WORKDIR /home/test

RUN cargo install --locked bat
RUN cargo install exa

RUN curl -fsSL https://fnm.vercel.app/install | bash

RUN mkdir /home/test/dotfiles

COPY .ackrc dotfiles
COPY .bash/ dotfiles/.bash
COPY .bash_profile dotfiles
COPY .compton.conf dotfiles
COPY .config/ dotfiles/.config
COPY .ctags dotfiles
COPY .gemrc dotfiles
COPY .gitconfig dotfiles
COPY .gitignore dotfiles
COPY .gitmodules dotfiles
COPY .ncmpcpp/ dotfiles/.ncmpcpp
COPY .psqlrc dotfiles
COPY .tmux.conf dotfiles
COPY .vim/ dotfiles/.vim
COPY .vimrc dotfiles
COPY .xinitrc dotfiles
COPY .Xresources dotfiles

COPY install dotfiles


RUN ./dotfiles/install

CMD ["bash"]
