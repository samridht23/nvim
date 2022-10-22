local g = vim.g
local o = vim.o

-- Leader Map
g.mapleader = " "
g.maplocalleader = " "

-- gui config
o.termguicolors = false
o.guifont = "JetBrains Mono NL:h8"

o.timeoutlen = 500
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
o.shiftwidth = 2
o.softtabstop = 2
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

--Neovide config
-- set gui font to viewable size
g.guifont = { "JetBrains Mono NL", "h5" }

-- Better buffer splitting
o.splitright = true
o.splitbelow = true
