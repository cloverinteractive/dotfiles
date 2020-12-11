scriptencoding utf-8

" needs to be first line
set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/LargeFile'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'docunext/closetag.vim'
Plug 'nono/vim-handlebars'
Plug 'briancollins/vim-jst'
Plug 'jinfield/vim-nginx'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/vim-eco'
Plug 'mxw/vim-jsx'
Plug 'slim-template/vim-slim'
Plug 'lilydjwg/colorizer'
Plug 'styled-components/vim-styled-components'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'larssmit/vim-getafe'
Plug 'wesgibbs/vim-irblack'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'

" Vim babel
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim'

Plug 'preservim/nerdtree'
Plug 'jparise/vim-graphql'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'airblade/vim-gitgutter'

Plug 'chriskempson/base16-vim'
call plug#end()

filetype plugin indent on

" Because we care for your eyes
set background=dark
colorscheme koehler
syntax on

if filereadable(expand("~/.vim/before"))
  source ~/.vim/before
endif

set hidden
set number
set ts=2 sts=2 sw=2 expandtab
set showtabline=2
set noshowmode

" Because it never works well
setglobal nobomb

" Lots of history
set history=1000

" Don't include hidden buffers in autocomplete
set complete=.,b,u,t

" Make cmdline tab completion similar to bash
set wildmode=list:longest

" I'm pretty sure this works for everyone
set term=screen-256color

" Shorter messages
set shortmess+=I

if has('mouse')
  set mouse=a
endif

" Lets use smartcase
set smartcase

" No wrapping please
set nowrap

" Don't resize split views automatically
set noequalalways

" Always show status line
set laststatus=2

" Enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~

" Minimal lines above and below the cursor
set scrolloff=5

" Minimal number of lines to scroll when the cursor gets off the screen
set scrolljump=5

" No toolbars
set guioptions=i

" Only render when necessary
set lazyredraw

" Autoindent because lazy
set autoindent

" Backspace over indent,eol,start
set backspace=indent,eol,start

" Use symbols to represent white space
set list
set listchars=tab:➙.,trail:·,extends:❱,precedes:❰,nbsp:░

" Set enconding and file encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8

" Remap leader to space
let mapleader = " "

" Remove highlights after searching
nmap <silent> <leader>/ :nohlsearch<CR>

" Change working directory to the current one
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Make lists easier to fill
inoremap {<CR>  {<CR>}<Esc>O<tab>
inoremap (<CR>  (<CR>)<Esc>O<tab>
inoremap [<CR>  [<CR>]<Esc>O<tab>

" When G is used don't stick to bottom
nn G G10<c-e>

" Autoescape motion
imap jj <esc>

" Shift enter, creates two lines and indents one above
inoremap <s-cr> <cr><cr><up><tab>

" Handle trailing whitespace, shamelessly taken from http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.rb,*.coffee,*.yml,*.haml,*.erb,*.php,*.java,*.py,*.js,*.html,*.eco :call <SID>StripTrailingWhitespaces() " Run this method on save

" Surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw# Wrap the token under the cursor in #{}
" v...s# Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35 = "#{\r}" " #

" Matchit is included in vim, it only needs to be activated
runtime macros/matchit.vim

" Tag bar is toggled with f8
nmap <F8> :TagbarToggle<CR><C-W>l

if filereadable(expand("~/.vim/after"))
  source ~/.vim/after
endif


let g:closetag_html_style=1
autocmd FileType jsx,html,xhtml,xml,htmldjango,jinjahtml,eruby,mako,eco silent!

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

" vim: filetype=vim
