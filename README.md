# Neovim configuration

A [Neovim](https://github.com/neovim/neovim) configuration written in Lua.

### Plugins used

- [packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager for Neovim written in Lua
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Provide Lua functions
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - For injecting LSP diagnostics
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Neovim Status line written in Lua
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Package manager for Neovim. Install and manage LSP server, DAP servers,linters and formatters.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Provide autopairs
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Provide completion while coding
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Provide better syntax highlighting
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - For configuring and code formatting using Neovim builtin LSP client.
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Fzf sorter for telescope
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim) - Provide icons to add into code
- [vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors) - Theme
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Provide icons
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Provide pictogram for LSP.
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Improve startup time for Neovim
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Provide Snippets for laguages
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Suggest path for module using nvim-cmp
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - nvim-cmp source for nvim lua
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for nvim builtin LSP client
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words. Provide snippets from buffer using nvim-cmp
- [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) - Better deletion of buffer
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua

### Keymaps

| Action               | Mapping     |
| -------------------- | ----------- |
| Leader Key           | `Space `    |
| Find files           | `<C-p>`     |
| Live Grep            | `<C-l>`     |
| netrw                | `<space>jj` |
| Formatting           | `<space>f`  |
| Telescope Help Tags  | `<leader>H` |
| Telescope buffers    | `'b`        |
| Telescope Git Status | `'c`        |
| Lsp Definition       | `gd`        |
| Lsp Type Definition  | `<space>D`  |
| Declaration          | `gD`        |
| Hover type inference | `K`         |
| Lsp Implementation   | `gi`        |
| Declaration          | `gD`        |
| Signature help       | `<C-k>`     |
| Global Buffer rename | `<space>rn` |
| Lsp Reference        | `gr`        |

### Packer

| Command            | Description                                                                  |
| ------------------ | ---------------------------------------------------------------------------- |
| ` :PackerComplete` | Fires after install, update, clean, and sync asynchronous operations finish. |
| ` :PackerCompile`  | Regenerate compiled loader file                                              |
| ` :PackerClean`    | Remove any disabled and unused plugins                                       |
| ` :PackerInstall`  | Clean, then install missing plugins                                          |
| ` :PackerUpdate`   | Clean, then update and then install plugins                                  |
| ` :PackerSync`     | Perform `PackerUpdate` and then `PackerCompile`                              |

### Treesitter

| Command                  | Description                |
| ------------------------ | -------------------------- |
| ` :TSInstall <language>` | Install language parser    |
| ` :TSInstallInfo`        | Info about language parser |

### LSP

| Command     | Description                        |
| ----------- | ---------------------------------- |
| ` :LspInfo` | Info about all lsp attached client |

> First install binaries of server to the system using system package manager
> Ex `sudo pacman -D tsserver` for typescript client

### Mason

| Command                         | Description                 |
| ------------------------------- | --------------------------- |
| ` :Mason`                       | Install LSP servers         |
| ` :MasonLog`                    | Print Log for LSP servers   |
| ` :MasonUninstall <lsp_server>` | Uninstall particular server |
