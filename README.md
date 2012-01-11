# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## install

* `git clone git@github.com:cloverinteractive/dotfiles.git ~/.dotfiles`
* `cd ~/.dotfiles`
* `rake install`

Your original dotfiles will be renamed to `name.orig` so no worries.

## uninstall

* `cd ~/.dotfiles`
* `cd rake uninstall`

You can optionally `rm -fr ~/.dotifiles` if you wish, your `name.orig` files will be restored by this action.

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
