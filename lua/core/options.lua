local g = vim.g
local o = vim.o

-- Leader Map
g.mapleader = " "
g.maplocalleader = " "

o.timeoutlen = 700
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 10

-- UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- Tabs and indent
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 0
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- To make neovim and host OS clipboard interact with each other
o.clipboard = "unnamedplus"

o.ignorecase = true
o.smartcase = true

-- Undo and Backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 100 items in commandline history
o.history = 100

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

vim.cmd([[colorscheme everforest]])
