-- Setup mise if shims exist
local MISE_PATH = vim.env.XDG_DATA_HOME .. "/mise/shims"

if vim.uv.fs_stat(MISE_PATH) then
    vim.env.PATH = MISE_PATH .. ":" .. vim.env.PATH
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.opt

-- Spacing and indentation
set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

-- Searching
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Split and scroll
set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true

-- Line numbers
set.number = true
set.relativenumber = true

-- Disable swapfiles
set.swapfile = false

set.cursorline = true
set.hidden = true

-- yank to clipboard
set.clipboard = "unnamed,unnamedplus"

-- orgmode conceal
set.conceallevel = 2
set.concealcursor = "nc"

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
