# dotfiles

This is a collection of dotfiles that should make your day to day work easier, if you see any errors or wish to contribute feel free to fork, open an issue
or send a pull request.

## Dependencies

We try to keep dependencies to a minimum and let you sort them out yourself, whether you prefer homebrew or your OS package manager the choice is yours
to make, the only three dependecies are:

1. `curl`
1. `git`
1. `node`

## Install

We try to keep installing as  simple as possible by keeping the steps to a minimum and our dotfiles as backward compatible across the couple of OS we use
the most.

### Online installer

You can run the installer using curl:

`curl https://raw.githubusercontent.com/cloverinteractive/dotfiles/master/install | bash`

Check our [developers](#developers) section of this README to learn how to run the installer in a virtual machine.

### Github checkout

You can fork or clone this repository manually and run the installer locally:

```bash
# We like to keep dotfiles somewhere in $HOME but you can clone anywhere you have permission to
git clone https://github.com/cloverinteractive/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
./install -s
```

### Advanced (not recommended)

Since we're using stow to manage the dotfiles under the hood, you can skip the installer and just stow files directly like
this, however depending on your system configuration you will need to set the directory and target manually, we've tried
to make things xdg compliant but cannot guarantee that will be the case if things are stowed manually:

```bash
cd .dotfiles
stow -d .config/bash -t .config
```

When doing this keep in mind that uninstalling can also get tricky and you'll need to remember how you linked your configs.

## Uninstall

To uninstall you can do `stow -D .` from your `.dotifles` directory and that will unlink all the files from that directory.

## Commands that will make this enjoyable

These dotfiles include configuration tweaks for:

* ack
* bash
* cava
* dunst
* git
* i3
* kitty
* mpd
* ncmpcpp
* nvim
* pg (postgresql)
* picom
* ranger
* tmux
* vim
* X11
* xmobar
* xmonad

To get most of these dotfiles we recommend installing these packages

## Developers

We try to make development as simple as possible for [ourselves](https://github.com/cloverinteractive/dotfiles/graphs/contributors), therefore we've added
in a `Dockerfile` for running our scripts in a docker container.

If you wish to see how these dotfiles look/feel  without installing them in your system  or you wisht to contribute please consider installing docker and
giving this a try:

```bash
docker build . -t dotfiles # Will build a docker image this may take a couple of minutes
docker run --rm -it dotfiles # This will put you in the containers command prompt
```

Once in the container you'll have your current branch dotfiles installed, if you are trying to test something in particular to test a config
the test user has `sudo` and you can install anything you need, we try to keep the Dockerfile pretty light only installing the bare minimum
and anything else we need that is not readily available in the distro's package manager, try not to add a bunch of dependencies to the `Dockerfile`
to ensure fast build times.


### Shells

At the moment we only add files for `bash` and `zsh` to keep things compatible with macs, if you'd like to
start your docker container with zsh just specify it as the run command like so:

```bash
docker run --rm -it dotfiles zsh
```

The same aliases, env vars and, prompt and paths should be set as bash if you'd like to inspect those files
they live under `.config/posix-shell`

## Issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
