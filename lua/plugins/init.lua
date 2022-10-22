local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "altercation/vim-colors-solarized" })
	use({ "bluz71/vim-moonfly-colors" })
	use({ "sainnhe/sonokai" })
	use({ "altercation/solarized" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })
	use({ "kyazdani42/nvim-web-devicons", event = "VimEnter" })
	use({ "onsails/lspkind.nvim", module = "lspkind" })
	use({ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } })
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	-- UI
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("plugins.configs.lualine")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSDisableAll",
			"TSEnableAll",
		},
		config = function()
			require("plugins.configs.treesitter")
		end,
	})
	-- Cmp
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp")
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		module = "luasnip",
		after = "nvim-cmp",
		wants = "friendly-snippets",
		config = function()
			require("plugins.configs.luasnip")
		end,
	})
	use({ "rafamadriz/friendly-snippets", opt = true })
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })
	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	-- File handling
	use({
		{
			"nvim-telescope/telescope.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.configs.telescope")
			end,
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			after = "telescope.nvim",
			run = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" },
	})
	-- LSP and formatting
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.lsp.null-ls")
		end,
	})
end)
