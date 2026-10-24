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

# Copy MISE binaries
COPY --from=ghcr.io/jdx/mise:2026.10.4 /usr/local/bin/mise /usr/local/bin/mise

RUN apt-get update \
  && apt-get -y --no-install-recommends install ca-certificates git \
  && rm -rf /var/lib/apt/lists/*

ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV PATH="/mise/shims:$PATH"

# Install neovim
RUN mise use neovim@latest

# Add don't require password for test in sudoers 
RUN echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Export ZDOTDIR for zsh
RUN echo 'export ZDOTDIR=$HOME/.config/zsh' >> /etc/zsh/zshenv

# Install latest starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

USER test

WORKDIR /home/test

# Install rustup in local dir
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
  | sh -s -- -y --profile minimal --default-toolchain stable

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

CMD ["bash"]
