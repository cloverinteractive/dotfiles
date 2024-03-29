# Posix shells base

These files contain configurations that any POSIX shell can load, things like aliases, $PATH updates and environment variables, we try to keep things
as organized as possible, for more information as to the order in which each file is loaded take a look ad `profile`, if you wish to contribute and
don't feel like your contribution fit in any of the existing files feel free to add new files that best describe the settings you're trying to add.

If you're building your own window manager and you wish for xdg paths to be available globally it is recommended that you update your `/etc/profile` file
with the following vars:

```sh
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

TMP_PATH=./bin:$HOME/.local/bin:$HOME/bin:$TMP_PATH

export PATH=$TMP_PATH:$PATH
```

This will ensure that when you start your DE/WM it will look up for config file and binaries in the XDG paths (`$HOME/.config/xmonad` and `$HOME/.config/xmobar` in
the case of Xmonad or `$HOME/.config/i3` for i3 amonst others).

## Your Shell config isn't enough for me

It is likely you have defined functions or aliases not contained in this path and you are worried to upgrade and lose them, in order to load them
you only need to create a file named `before` with anything you'd like to prepend to your shell environment or add them to the file named `after`
if you want to load them at the very end, if you'd like to contribute we'd appreciate if you segment your configs based on content, e.g. aliases go
in `aliases` and path changes go in `paths` and so on

### $PATH

We always put `./bin` and `$HOME/bin` at the begining of `$PATH`.

```bash
export PATH=./bin:$HOME/bin:$PATH
```

The idea is that you can just put any script into any bin folder and the home folder and the shell will know to look there or `$HOME/bin` before trying
your system `bin` or other path. If you need to change `$PATH` it is recommended that you do so at in `.config/posix-shell/paths`.

## Checkout what's listening

Our bash config includes a `listening` alias that shows what is listening and in what port here's how it looks:

![listening](listening.png)


## Command Prompt

Since v4.0.0 we'e started using [starship](https://starship.rs/), it is highly efficient and has the same features as powerline.
