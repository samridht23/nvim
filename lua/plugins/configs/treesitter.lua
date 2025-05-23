require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"html",
		"css",
		"scss",
		"lua",
		"vim",
		"vimdoc",
		"tsx",
		"svelte",
		"typescript",
		"javascript",
		"go",
		"gomod",
		"gosum",
		"python",
		"rust",
		"styled",
		"dockerfile",
		"cmake",
		"sql",
		"query",
		"regex",
		"jq",
		"dot",
		"csv",
		"toml",
		"yaml",
		"markdown",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
