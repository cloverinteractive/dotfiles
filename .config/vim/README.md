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

### Large File

Editing large files can be a time consuming process as Vim is working on a number of things behind the scenes, such as maintaining an undo database, searching for a syntax highlighting synchronization point, etc.  LargeFile.vim is a very small "plugin"; mostly, its just an autocmd that disables certain features of vim in the interests of speed. 

### Indent Guides

Indent Guides is a plugin for visually displaying indent levels in Vim.

### Airline

Airline is a utility plugin which allows you to create better-looking, more functional vim statuslines.

### NerdCommenter

A plugin that allows for easy commenting of code for many filetypes.

### Polyglot

A collection of language packs for vim, syntax highlighting in a single plugin.

## Tweaks
* Leader is mapped to space
* Removed bom
* Wildmode is enabled
* (`{,(,[`) + `enter` sets the cursor in the middle and creates a new indent.
* jj in insert mode changes to normal mode
* `<shift> + <enter>` Adds two lines and indents the one above
* Indentguides enabled by default

## Tips
