#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Print red
function error() {
printf "\r${RED}$1${NC}\n"
}

# Print green
function success() {
printf "\r${GREEN}$1${NC}\n"
}

# Print yellow
function info() {
printf "\r${YELLOW}$1${NC}\n"
}


function install_rbenv() {
  info "Installing rbenv for you..."

  # Fetching rbenv from git
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile.before

  source ~/.bash_profile.before

  if test $(which rbenv); then
    success "rbenv installed"
    info "fetching ruby-build..."

    cd ~/.rbenv && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    cd $HOME

    if [[ $? == 0 ]]; then
      success "ruby-build installed"
    fi
  fi
}

function fetch_dotfiles() {
  info "Fetching dotfiles..."

  git clone https://github.com/cloverinteractive/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles

  # Setup submodules to get Vundle working
  git submodule init
  git submodule update

  info "Installing ruby..."
  rbenv install

  if [[ $? == 0 ]]; then
    success "ruby installed"
  fi
}

# Check for a path to rbenv
if test !$(which rbenv); then
  if test $(which git); then
    install_rbenv

    fetch_dotfiles
  fi
fi
