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

### LustyJuggler and LustyExplorer
Easier file and buffer navigation.

* LustyExplorer

`<leader>, f, l` starts file explorer from the pwd
`<leader>, f, r` starts file explorer from the folder of the current file
`<tab>` or `<enter>` to open

* LustyJuggler
`<leader>, l, b` open the buffer browser

### Large File
Editing large files can be a time consuming process as Vim is working on a number of things behind the scenes, such as maintaining an undo database, searching for a syntax highlighting synchronization point, etc.  LargeFile.vim is a very small "plugin"; mostly, its just an autocmd that disables certain features of vim in the interests of speed. 

### Syntastic
Syntastic is a syntax checking plugin for Vim that runs files through external syntax checkers and displays any resulting errors to the user. This can be done on demand, or automatically as files are saved. If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them.

### Indent Guides
Indent Guides is a plugin for visually displaying indent levels in Vim.

### Tabular
Sometimes, it's useful to line up text. Naturally, it's nicer to have the computer do this for you, since aligning things by hand quickly becomes unpleasant. While there are other plugins for aligning text, the ones I've tried are either impossibly difficult to understand and use, or too simplistic to handle complicated tasks. This plugin aims to make the easy things easy and the hard things possible, without providing an unnecessarily obtuse interface. It's still a work in progress, and criticisms are welcome.

### Autotag
If you use ctags to make tags files of your source, it's nice to be able to re-run ctags on a source file when you save it.

However, using ctags -a will only change existing entries in a tags file or add new ones. It doesn't delete entries that no longer exist. Should you delete an entity from your source file that's represented by an entry in a tags file, that entry will remain after calling ctags -a.

### Powerline
Powerline is a utility plugin which allows you to create better-looking, more functional vim statuslines.

### SuperTab
Supertab allows you to use <Tab> for all your insert completion needs

### NerdCommenter
A plugin that allows for easy commenting of code for many filetypes.

### Vim-eco

Add support for eco files syntax highlight

### Vim-toml
Support for toml file syntax

## Tweaks
* Leader is mapped to space
* Removed bom
* Wildmode is enabled
* (`{,(,[`) + `enter` sets the cursor in the middle and creates a new indent.
* jj in insert mode changes to normal mode
* `<shift> + <enter>` Adds two lines and indents the one above
* Indentguides enabled by default
* Added # for ruby string interpolation for surround
* Changed next cursor to `ctrl+l` on Ultisnips

## Tips
