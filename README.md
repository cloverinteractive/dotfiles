# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## install

* `git clone git@github.com:cloverinteractive/dotfiles.git ~/.dotfiles`
* `cd ~/.dotfiles`
* `bundle install`
* `rake install`

Your original dotfiles will be renamed to `name.orig` so no worries.

## uninstall

* `cd ~/.dotfiles`
* `rake uninstall`

Afterwards you can optionally `rm -fr ~/.dotifiles` if you wish, your `name.orig` files will be restored by having run `rake uninstall`.

## Prerequisites

* ruby of course
* rake
* erb
* term/ansicolor

```bash
gem install rake
gem install erb
gem install term-ansicolor
```

## Your Bash config isn't enough for me

It is likely you have defined functions or aliases not contained in this config and you are worried to upgrade and lose them, you can add those little extras
to a file named `.bash_extras` under your `$HOME` dir and they will be automatically loaded.

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

You can install each of this with a simple `port install <package>`.

## issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
