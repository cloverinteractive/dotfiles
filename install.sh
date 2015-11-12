#!/bin/sh

# Where we're at right now
START_WD=$(pwd)

# All the colors we're using for notifications
SWITCH="\033["
RED="${SWITCH}0;31m"
GREEN="${SWITCH}0;32m"
YELLOW="${SWITCH}[1;33m"
NORMAL="${SWITCH}[0m"

# Print red
function error() {
  printf "\r${RED}$1${NORMAL}\n"
}

# Print green
function success() {
  printf "\r${GREEN}$1${NORMAL}\n"
}

# Print yellow
function info() {
  printf "\r${YELLOW}$1${NORMAL}\n"
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

function install_homebrew() {
  if test ! $(which brew); then
    info "Installing homebrew..."

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    if [[ $? == 0 ]]; then
      success "Homebrew installed"

      ## Load homebrew
      echo 'export PATH="/usr/local/bin:/usr/local/sbin:$PATH"' > ~/.bash_profile.before
      source ~/.bash_profile.before
    fi
  fi
}

function install_git() {
  # TODO: We need to decide wether to check the kernel and do things differently when we're not
  # using Darwin, or install linux brew when running linux then brewing from this point onward should
  # be exactly the same for both OS
  # https://github.com/Homebrew/linuxbrew
}

if [[ $(uname) == "Darwin" ]]; then
  install_homebrew
fi

if test !$(which git); then install_git; fi
if test !$(which rbenv); then install_rbenv; fi

# Fetch dotfiles from github and install
fetch_dotfiles
install
