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
this:

```bash
cd .dotfiles
stow bash
```

That will install/link all the bash related files, however keep in mind that you'll have to manually run any additional
step that you may be skipping by doing this,  like installing vim plugins or checking that dependencies are met.

## Uninstall

To uninstall you can do `stow -D folderName` from your `.dotifles` directory and that will unlink all the files
from that directory.

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
* i3wm

To get most of these dotfiles we recommend installing these packages

## Developers

We try to make development as simple as possible for [ourselves](https://github.com/cloverinteractive/dotfiles/graphs/contributors), therefore we've added
in a `Dockerfile` for running our scripts in a docker container.

If you wish to see how these dotfiles look/feel  without installing them in your system  or you wisht to contribute please consider installing docker and
giving this a try:

```bash
docker build . -t dotfiles # Will build a docker image this may take a couple of minutes
docker run --rm  -it dotfiles bash # This will put you in the containers command prompt
```

Once in the container you have a few options based on what you're trying to do (you only need to one of the four):

```bash
# Install from the locally copied dotfiles folder
cd dotfiles
./install -s

# Fetch from git and install
./dotfiles/install -b your-git-branch-name

# Use curl as you normally would (this is useful to test your installer tweaks over curl)
curl https://raw.githubusercontent.com/cloverinteractive/dotfiles/your-branch-name/install  | bash -s -- -b your-branch-name

# Run the installer over curl normally and install normally
curl https://raw.githubusercontent.com/cloverinteractive/dotfiles/master/install | bash
```

It is highly recommended that you look at the `install` and `backup` scripts included with the project for more information about the available flags/options at your disposal.

## Issues

These dotfiles are still in the works and are not perfect, feel free to advise, fork and send your pull requests.
