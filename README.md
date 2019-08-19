# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## Install

We try to keep installing as  simple as possible by keeping the steps to a minimum and our dotfiles as backward compatible across the couple of OS we use
the most.

### Online installer

We provide a simple online installer, if you're running Ubuntu, Debian or OSX, it will automatically try to resolve dependencies, install rbenv, install
homebrew or linuxbrew depending on the OS you're running; if your OS is not supported you can still resolve dependencies and generate the files manually.

`curl https://raw.githubusercontent.com/cloverinteractive/dotfiles/master/install | sh`

Check our [developers](#developers) section of this README to learn how to run the installer in a virtual machine.

### Github checkout

If you want to resolve dependencies on your own, you can install by doing a simple github checkout.

```bash
# We like to keep dotfiles somewhere in $HOME but you can clone anywhere you have permission to
git clone https://github.com/cloverinteractive/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
bundle install
rake
```

Your original dotfiles will be renamed to `name.orig` so you can always restore them.

## Uninstall

Our uninstall script is still a work in progress, to run it simply do run the uninstall task from your dotfiles folder.

```bash
rake uninstall
```

Afterwards you can optionally `rm -fr ~/.dotifiles` if you wish, your `name.orig` files will be restored by having run `rake uninstall`.

## Prerequisites

Only if you don't run the `install` script provided

* [ruby](http://www.ruby-lang.org)
* [bundler](http://gembundler.com/)

`gem install bundler`

### Getting ruby

We recommend getting ruby via [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build). This is the way our remote installer
installs ruby, however this is not mandatory; you can install ruby in anyway you want.

## Upgrade single bits

If you already have dotfiles installed (all symlinks have been created) you can upgrade small bits like this:

```bash
cd  ~/.dotfiles
git pull
rake bash # bash being the bit you wish to upgrade
```

If you don't know what bits are available in dotfiles; simply run `rake -T` for a full list of tasks.

## Commands that will make this enjoyable

These dotfiles include configuration tweaks for:

* ncmpcpp
* bash
* rubygems
* git
* vim
* tmux
* postgresql
* ack

To get most of these dotfiles we recommend installing these packages

## Homebrew

Homebrew makes managing and installing packages in both Linux and OSX pretty simple. This is not required for Linux since most distributions have a pretty robust package manager;
hoewever homebrew allows you to install packages directly into `$HOME` without special permissions, and in many cases unavailable or newer packages that your OS package manager does
not include.

You can install each of this with a simple `brew install <package>`.

### OSX with [Homebrew](https://github.com/Homebrew/homebrew)

If you're on a mac we highly recommend using [Homebrew](https://github.com/Homebrew/homebrew), it's constantly getting updates and it's pretty clean and easy to manage, here's
a list of packages you should be looking to install.

* git
* coreutils
* vim
* macvim
* readline
* openssl

### Linux with [Linuxbrew](https://github.com/Linuxbrew/brew)

If you're using linux and would like to install packages to your `$HOME` then [Linuxbrew](https://github.com/Linuxbrew/brew) is a simple way to get this done, like homebrew it gets
frequent updates and it's pretty clean and easy to maintain, not to mention it has formulas for many of the same packages homebrew does, should a package not be present it's only a matter
of falling back to the OS package manger.

Make sure to add linuxbrew into your PATH like in `.bash_profile.after`:

```sh
PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
```

## Developers

We try to make development as simple as possible for [ourselves](https://github.com/cloverinteractive/dotfiles/graphs/contributors), therefore we've worked in a way for easily running our
scripts in a docker container that we use as a sandbox for our [installer](https://github.com/cloverinteractive/dotfiles/blob/master/install).

```bash
git clone https://github.com/cloverinteractive/dotfiles.git
cd dotfiles

# Building docker image
docker build . -t dotfiles

# Run dokcer container
docker run --rm -it -t dotfiles

# Installing in container once inside
current/install [remote-branch-name]
```

The `current/` folder contains your current copy of the dotfiles, you can install from this copy but you will have to satisfy dependencies in your OS as the Rakefile won't do this for you.

## issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
