local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

local options = {
    ensure_installed = {"lua"},
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true
    },
    autopairs = {enable = true},
    indent = {enable = true}
}
treesitter.setup(options)

