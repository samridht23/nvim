require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  filters = {
    dotfiles = true,
  },
  view = {
    side = 'right',
  },
})

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
