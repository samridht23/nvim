-- create a local variable 'o' that references
-- the 'opt' object provided by vim/neovim lua API.
-- The 'opt' object provides a way to set vim/neovim options using lua syntax.
local o = vim.opt

-- create a local variable 'g' that references
-- the global vim/neovim lua API object. It provides
-- a way to get global variables in vim/neovim using lua syntax.
local g = vim.g

-- Leader Key Map
-- set the leader key to 'space key'
g.mapleader = " "

-- vim/neovim will wait for 400 milliseconds
-- for a complete key code sequence to be received
-- before assuming that the user has typed a partial sequence
o.timeoutlen = 200

-- the screen will be updated every 200 milliseconds during buffer-modifying operations
o.updatetime = 200

-- number of lines to keep above and below the cursor
-- help to keep cursor in the center of screen
o.scrolloff = 10

-- display number line
o.number = true
o.numberwidth = 2
o.ruler = false

-- enable relative number line
o.relativenumber = true

-- highlight the whole line in which cursor is present
o.cursorline = true

-- display sign column, used to display types of
-- markers,breakpoint in debugging, error/warning
-- indicators and git diff markers
o.signcolumn = "yes"


-- Indenting

-- "TAB" key will insert spaces instead of a tab character
o.expandtab = true
-- For C-like languages neovim will uses the "C-indentin" algorithm for auto-indentation
o.cindent = true
-- When you start a new line, neovim will automatically indent the line based
-- on the indentation level of the previous line.
-- To adjust the indentation of an existing line you
-- can use command `Ctrl + >` or `Ctrl + <'
o.autoindent = true

-- effectively disables automatic text wrapping
-- o.textwidth = 0

-- set tab to 2 spaces
o.tabstop = 2
-- when autoindent is enabled neovim will ues 4 space for each level of indentation
o.softtabstop = 2

-- when we command `Ctrl + >` or `Ctrl + <` to manually indent
-- neovim will use 2 spaces for each level of indentation
o.shiftwidth = 2

-- non-printable character such as spaces, tabs and line endings will be displayed using special symbols.
o.list = true

-- trail:·: The · symbol is used to represent trailing whitespace.
-- nbsp:◇: The ◇ symbol is used to represent non-breaking spaces.
-- tab:→: The → symbol is used to represent tab characters.
-- extends:▸: The ▸ symbol is used to represent lines that are extended due to a line break in a wrapped line.
-- precedes:◂: The ◂ symbol is used to represent lines that precede an extended line.

-- set apperance of non-printable characters
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- enable to use system clipboard from neovim (xclip for X11 and wl-clipboard for Wayland)
o.clipboard = "unnamedplus"

-- treat uppercase and lowercase as equivalent when performing serches and substitutions
o.ignorecase = true

-- neovim will perform case-insensitive earches if the search pattern only lowercase and vice-versa for uppercase
o.smartcase = true

-- neovim will not create backup copies of files before saving changes to them.
o.backup = false

-- neovim will not create a backup copy of the original file before overwriting it with changes.
o.writebackup = false

-- allow recover from previous versions of the file even after closing vim
o.undofile = true

-- disables swap files to store changes to the edited file in case of a crash or other interruption.
o.swapfile = false

-- remember 100 items in command line history
o.history = 100

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- enables mouse cursor in all modes for scrolling, resizing window, selecting text and clicking on menu items
o.mouse = "a"

-- neovim can use more than 256 colors available in standard 8-bit color palette.
o.termguicolors = true
