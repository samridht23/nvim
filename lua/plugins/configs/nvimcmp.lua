local cmp = require('cmp')

local function border(hl_name)
    return {
        { "╭", hl_name }, { "─", hl_name }, { "╮", hl_name }, { "│", hl_name },
        { "╯", hl_name }, { "─", hl_name }, { "╰", hl_name }, { "│", hl_name }
    }
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        -- give border to completion popup
        completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
        },
        -- give border to documentation
        documentation = { border = border "CmpDocBorder" }
    },
    mapping = cmp.mapping.preset.insert({
        -- ["<C-p>"] = cmp.mapping.select_prev_item(), -- move to previous completion
        -- ["<C-n>"] = cmp.mapping.select_next_item(), -- move to next completion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- Mover over Snipets
        ["<Tab>"] = cmp.mapping(
            function(fallback) -- use to map over completion
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-expand-or-jump", true,
                        true, true), "")
                else
                    fallback()
                end
            end, { "i", "s" }),
        -- Move over Snipets reverse
        ["<S-Tab>"] = cmp.mapping(
            function(fallback) -- super tab for jump to snippet locations
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-jump-prev", true, true,
                        true), "")
                else
                    fallback()
                end
            end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        -- provide snippet from LSP
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        -- provide snippet from buffer
        { name = 'buffer' },
        -- provide file path to luasnip
        { name = 'path' },
        -- provide neovim function for lua development
        { name = "nvim_lua" },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}
require('lspconfig')['svelte'].setup {
    capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}
require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
}
