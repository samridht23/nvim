local ok, cmp = pcall(require, "cmp")
if not ok then
  error("Error loading nvim-cmp:", cmp)
end

local function border(hl_name)
  hl_name = hl_name or "FloatBorder"
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- Provide snipet engine here.
    end,
  },
  window = {
    completion = {
      border = border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = { border = border("CmpDocBorder") },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(), -- move to previous completion
    ["<C-n>"] = cmp.mapping.select_next_item(), -- move to next completion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- trigger the cmp suggestion
    ["<C-e>"] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- Mover over Snipets
    ["<Tab>"] = cmp.mapping(function(fallback) -- use to map over completion
      local lasnip = require("luasnip")
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    -- Move over Snipets reverse
    ["<S-Tab>"] = cmp.mapping(function(fallback) -- super tab for jump to snippet locations
      local lasnip = require("luasnip")
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
  },
  sources = cmp.config.sources({
    -- Snippet from LSP
    { name = "nvim_lsp" },
    -- Snippet engine
    { name = "luasnip" },
  }, {
    -- Snippet from buffer
    { name = "buffer" },
    -- File path snippet
    { name = "path" },
    -- Neovim function for lua development
    { name = "nvim_lua" },
  }),
})

-- Set configuration for specific filetype.
local git_ok, cmp_git = pcall(require, "cmp_git")
if git_ok then
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" },
    }, {
      { name = "buffer" },
    }),
  })
end

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local servers = { "pylsp", "pyright", "rust_analyzer", "ts_ls", "svelte", "clangd", "gopls", "lua_ls" }
local lspconfig = require("lspconfig")

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end
