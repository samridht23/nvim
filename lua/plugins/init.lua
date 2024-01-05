local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"nvim-tree/nvim-web-devicons",
	},
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins/configs/nvim-cmp")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("plugins/configs/kanagawa")
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/configs/git-signs")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins/configs/treesitter")
		end,
		build = function()
			vim.cmd(":TSUpdate")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/configs/lualine")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/configs/nvim-lsp")
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("plenary")
		end,
		config = function()
			require("plugins/configs/telescope")
		end,
	},
}

require("lazy").setup(plugins)
