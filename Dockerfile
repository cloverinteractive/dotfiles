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
  build-essential \
  jq \
  ack-grep \
  fzf \
  vim \
  curl \
  git \
  lsof \
  bash \
  stow \
  xz-utils \
  sudo

# Add don't require password for test in sudoers 
RUN echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install latest starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Install nvim 0.7.2
RUN curl -L https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb -o nvim.deb
RUN dpkg -i nvim.deb
RUN rm -fr nvim.deb

USER test

WORKDIR /home/test

RUN mkdir /home/test/.dotfiles

# Clone xdg-ninja
RUN git clone https://github.com/b3nj5m1n/xdg-ninja.git

COPY .bash_profile /home/test/.dotfiles/.bash_profile
COPY .bashrc /home/test/.dotfiles/.bashrc
COPY .config /home/test/.dotfiles/.config
COPY .gitignore /home/test/.dotfiles/.gitignore
COPY .profile /home/test/.dotfiles/.profile
COPY .xprofile /home/test/.dotfiles/.xprofile
COPY install /home/test/.dotfiles/install

RUN sudo chown -R test:test /home/test/.dotfiles
RUN cd /home/test/.dotfiles && ./install -s

# Remove this nonsense coming from /etc/bash.bashrc
RUN rm ~/.sudo_as_admin_successful

CMD ["bash"]
