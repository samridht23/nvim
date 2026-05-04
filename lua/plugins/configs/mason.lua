require("mason").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tsserver",
    "gopls",
    "clangd",
    "graphql",
  },
  automatic_installation = true,
})
