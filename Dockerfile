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

# load nixpgks paths
RUN echo ". /home/test/.nix-profile/etc/profile.d/nix.sh" >> .bashrc

RUN mkdir /home/test/dotfiles

ADD . /home/test/dotfiles/


CMD ["bash"]
