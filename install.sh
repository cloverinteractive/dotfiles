#!/bin/sh

# Where we're at right now
START_WD=$(pwd)

# All the colors we're using for notifications
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

function install() {
  info "Installing dotfiles..."

  cd ~/.dotfiles

  # Install the ruby bundler
  gem install bundler && rbenv rehash

  # Install ruby dependecies and run Rake tasks
  bundle install
  rake install

  if [[ $? == 0 ]]; then
    # Reload our new env and move back to HOME
    source ~/.bash_profile

    # Let's move back to where we ran the installer from
    cd $START_WD 

    success "dotfiles generated"
  fi
}

# Check for a path to rbenv
if test !$(which rbenv); then
  if test $(which git); then
    install_rbenv
    fetch_dotfiles
    install
  fi
fi
