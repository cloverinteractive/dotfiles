# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## Install

* `git clone https://github.com/cloverinteractive/dotfiles.git ~/.dotfiles`
* `cd ~/.dotfiles`
* `bundle install`
* `rake`

Your original dotfiles will be renamed to `name.orig` so no worries.

## Uninstall

* `cd ~/.dotfiles`
* `rake uninstall`

Afterwards you can optionally `rm -fr ~/.dotifiles` if you wish, your `name.orig` files will be restored by having run `rake uninstall`.

## Prerequisites

* [ruby](http://www.ruby-lang.org) of course
* [bundler](http://gembundler.com/)

`gem install bundler`

## Upgrade single bits

If you already have dotfiles installed (all symlinks have been created) you can upgrade small bits like this:

* `cd  ~/.dotfiles`
* `git pull`
* `rake bash # bash being the bit you wish to upgrade` 

## Commands that will make this enjoyable

### OSX + macports

* p5-app-ack
* git-core
* coreutils
* vim
* macvim
* ruby
* rb-rubygems
* bash-completion
* tmux

You can install each of this with a simple `port install <package>`.

## issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
