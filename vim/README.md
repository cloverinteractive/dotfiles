# Vim Info:


## The rules

In the past a vast number of plugins and tweaks have made it into this repository without any explanation or documentation. Given that we are not very good at keeping ourselves up to date with what goes on with this repo, these are the rules:

* From this point on contributors will be required to add their plugin or tweak to this **README** followed by a brief explanation and a couple of links explaining why it needs to be here.

* Plugins that are helpful but get in the way of the developer or are included simply because of tasted (e.g. vim colors) may be included but not activated by default, doing so will prevent your pull request from being merged.

* Make sure to update the **Requirements** section if your change adds a new requirement.

* All inclusions must be platform independent.

## Requirements

* Vim 7.0 or latest with either python or ruby support

## Plugins

### CloseTag

It simply closes HTML and XML tags intelligently and ignores already closed tags e.g. `<some-element />`, just open close your tag as you'd normally would, when you type `</` CloseTag will detect and close the tag automatically.

For additional info checkout the project's [page](http://www.vim.org/scripts/script.php?script_id=13).

### Tagbar

Tagbar is added automatically but does not opens, automatically this in order to avoid getting in the way of devs that 
might not want to use it, however you can open it from command mode by doing `TagBarOpen` or bind it to a key by doing
`nmap <F8> :TagbarToggle<CR>` in your `.vimrc.after` or `.gvimrc.after`.

It provides a nice ctags navigation within your files, you'll need `exuberant-ctags` installed.

Additional info can be found at the project's [wiki](https://github.com/majutsushi/tagbar/wiki).


### Solarized

Solarized is included but not loaded by default, if you'd like to load it simply type or add `colorscheme solarized` to your `vimrc.after` or `gvimrc.after`, for a better experience setting the following could help:

```vim
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
```

Visit the project's [README](https://github.com/altercation/vim-colors-solarized/blob/master/README.mkd) for more.


### vim-handlebars

Syntax highlighting for Handlebars, [README](https://github.com/nono/vim-handlebars/blob/master/README.md).


## Tweaks

## Tips
