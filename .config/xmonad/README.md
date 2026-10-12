# Xmonad

Before you can start using this config of xmonad you will need to install xmonad, xmonad-contrib and xmobar
I would recommend fetching from git as it will ensure every one of the new features work.

Start by fetching xomnad and xmonad-contrib into your xmonad config director, and add a `stack.yml` like this:

```yaml
snapshot: lts-24.63

packages:
- .
- xmonad
- xmonad-contrib
```

Once you've done this run `stack install` and add xmonad to GDM by adding this file:

```
[Desktop Entry]
Name=Xmonad
Type=XSession
Comment=Xmonad tiling window manager
Exec=/path/to/your/xmonad-binary
```

Starting xmonad should look similar to this:

![xmonad](desktop.png)

## hsl

You may want to open nvim as such `env LANG=C.UTF-8 nvim` if you're not setting LANG globally as hls will require this.
