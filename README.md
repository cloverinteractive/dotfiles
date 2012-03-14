# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## Install

* `git clone git@github.com:cloverinteractive/dotfiles.git ~/.dotfiles`
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

## Your Bash config isn't enough for me

It is likely you have defined functions or aliases not contained in this config and you are worried to upgrade and lose them, in order to kep them and load them
you only need to create a file named `.bash_profile.before` which will be loaded before our `.bash_profile` and a file named `.bash_profile.after` which will
be loaded after.

## Upgrade single bits

If you already have dotfiles installed (all symlinks have been created) you can upgrade small bits like this:

* `cd  ~/.dotfiles`
* `git pull`
* `rake install:bash # bash being the bit you wish to upgrade` 

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

## tmux bindings

For convenience we have changed the following to the `tmux` config:

* To be consistent with `screen` (yeah I'm an old `screen` user) instead of binding the `tmux` prefix to `C-b` we prefix to `C-a`.
* We binded `|` to `split-window -v`, it makes it more obvious you meant vertical split.
* We binded `-` to `split-window -v`, it makes it more obvious you meant horizontal split.

## issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
