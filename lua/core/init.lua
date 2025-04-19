-- Variables
-- https://neovim.io/doc/user/lua-guide.html#lua-guide-variables

-- Options
-- https://neovim.io/doc/user/quickref.html#option-list

local g = vim.g
local o = vim.opt

g.mapleader = " "

o.timeoutlen = 200
o.updatetime = 200
o.scrolloff = 15
o.relativenumber = true
o.numberwidth = 2
o.ruler = true
o.cursorline = true
o.signcolumn = "yes:1"
o.cindent = true
o.autoindent = true
o.autoread = true
-- o.background = "dark"
o.backup = false
o.writebackup = false
o.swapfile = false
o.history = 10000
o.splitright = true
o.splitbelow = true
o.mouse = "a"
o.termguicolors = true
o.clipboard = "unnamedplus"
o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.belloff = "all"

o.background = "dark"

