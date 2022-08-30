FROM ubuntu:rolling

ENV SHELL bash
ENV DEBIAN_FRONTEND noninteractive
ENV USER test

RUN useradd test
RUN usermod -aG sudo test
RUN mkdir /home/test
RUN chown test:test -R /home/test

RUN apt-get update
RUN apt-get install -y \
  bat \
  ack-grep \
  fzf \
  curl \
  git \
  lsof \
  bash \
  stow \
  tmux \
  xz-utils \
  sudo

# Add don't require password for test in sudoers 
RUN echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install latest starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

USER test

WORKDIR /home/test

# Add nixpkgs
RUN curl -sSL https://nixos.org/nix/install | sh -s -- --no-daemon

RUN mkdir /home/test/.dotfiles

COPY .ackrc /home/test/.dotfiles/.ackrc
COPY .bash_profile /home/test/.dotfiles/.bash_profile
COPY .bashrc /home/test/.dotfiles/.bashrc
COPY .config /home/test/.dotfiles/.config
COPY .gitconfig /home/test/.dotfiles/.gitconfig
COPY .gitignore /home/test/.dotfiles/.gitignore
COPY .psqlrc /home/test/.dotfiles/.psqlrc
COPY .xinitrc /home/test/.dotfiles/.xinitrc
COPY .xprofile /home/test/.dotfiles/.xprofile
COPY .Xresources /home/test/.dotfiles/.Xresources
COPY install /home/test/.dotfiles/install

RUN cd /home/test/.dotfiles && ./install -s

CMD ["bash"]
