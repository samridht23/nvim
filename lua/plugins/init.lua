local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "nvim-lua/plenary.nvim" },
  {
    "mason-org/mason.nvim",
    config = function()
      require("plugins.configs.mason")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.nvim-lsp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").load()
      require("luasnip.loaders.from_lua").load()
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.configs.nvim-cmp")
    end,
  },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "jannis-baum/vivify.vim" },
  { "MunifTanjim/nui.nvim" },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = 'latexmk'
    end
  },
  {
    "horanmustaplot/xcarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme xcarbon")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.git-signs")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.configs.lualine")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
    end,
    config = function()
      require("plugins.configs.treesitter")
    end,
    build = function()
      vim.cmd(":TSUpdate")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.configs.neo-tree")
    end,
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require("plenary")
    end,
    config = function()
      require("plugins.configs.telescope")
    end,
  },
}

require("lazy").setup(plugins)
