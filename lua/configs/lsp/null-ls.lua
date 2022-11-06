local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add binary formatter here 
-- null-ls uses system binary formatter for formatting insted of 3rd party language server

null_ls.setup {
    sources = {formatting.prettier, formatting.stylua},
    -- auto format on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({timeout_ms = 2000})
                end
            })
        end
    end
}

