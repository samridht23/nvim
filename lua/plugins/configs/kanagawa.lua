require("kanagawa").setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { italic = false },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}

	-- Themes available
	-- wave -> dark
	-- dragon -> dark
	-- lotus -> light

	theme = "dragon", -- Load <theme_name> when vim.opt.background is not set
	background = {
		dark = "dragon",
		light = "lotus",
	},
})
