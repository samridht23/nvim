local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
  vim.notify("Failed to load nvim-lspconfig", vim.log.levels.ERROR)
  return
end

local lsp_config = vim.lsp.config

lsp_config['pyright'] = {}
lsp_config['zls'] = {}
lsp_config['postgres_lsp'] = {}
lsp_config['rust_analyzer'] = {}

lsp_config["graphql"] = {
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "typescriptreact", "javascriptreact", "gql" },
  root_markers = { ".git", "package.json" },
}

lsp_config['clangd'] = {
  cmd = { "clangd", "--extra-args=-std=c++11" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = vim.fs.root(0, { "compile_commands.json", ".clangd", ".git" }),
}

lsp_config['gopls'] = {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = false,
      gofumpt = true,
    }
  }
}

lsp_config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "require" } },
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

local servers = {
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "svelte",
  "clangd",
  "gopls",
  "lua_ls",
  "graphql"
}
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
