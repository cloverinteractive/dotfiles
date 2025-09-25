FROM docker.io/ubuntu:rolling

ENV DEBIAN_FRONTEND noninteractive
ENV USER test

RUN useradd test
RUN usermod -aG sudo test
RUN mkdir /home/test
RUN chown test:test -R /home/test

RUN apt-get update
RUN apt-get install -y \
  bat \
  build-essential \
  jq \
  ack-grep \
  fzf \
  curl \
  git \
  lsof \
  bash \
  stow \
  xz-utils \
  sudo \
  zsh

# Install xmonad dependencies
RUN sudo apt-get install -y \
  git \
  haskell-stack \
  libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev

# Add don't require password for test in sudoers 
RUN echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Export ZDOTDIR for zsh
RUN echo 'export ZDOTDIR=$HOME/.config/zsh' >> /etc/zsh/zshenv

# Install latest starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Install nvim stable
RUN curl -L https://github.com/neovim/neovim-releases/releases/download/v0.11.3/nvim-linux-x86_64.deb -o nvim.deb
RUN dpkg -i nvim.deb
RUN rm -fr nvim.deb

USER test

WORKDIR /home/test

RUN mkdir /home/test/.dotfiles

# Clone xdg-ninja
RUN git clone https://github.com/b3nj5m1n/xdg-ninja.git

COPY .bashrc /home/test/.dotfiles/.bashrc
COPY .config /home/test/.dotfiles/.config
COPY .xprofile /home/test/.dotfiles/.xprofile
COPY .stow-local-ignore /home/test/.dotfiles/.stow-local-ignore
COPY install /home/test/.dotfiles/install

RUN sudo chown -R test:test /home/test/.dotfiles
RUN cd /home/test/.dotfiles && ./install -s

# Remove this nonsense coming from /etc/bash.bashrc
RUN rm ~/.sudo_as_admin_successful

CMD ["bash"]
