local map = vim.keymap.set
local vd = vim.diagnostic
local api = vim.api
local tb = require("telescope.builtin")

vd.config({
  virtual_text = false,
  float = { border = "rounded" },
})

local opts = { noremap = true, silent = true }

-- telescope
map("n", "<C-p>", tb.find_files, opts)
map("n", "<C-l>", tb.live_grep, opts)
map("n", "<C-s>", tb.grep_string, opts)
map("n", "<C-t>", tb.treesitter, opts)
map("n", "<C-y>", tb.git_status, opts)
map("n", "<C-u>", tb.git_commits, opts)
map("n", "<C-m>", tb.man_pages, opts)

map("n", "<leader>l", tb.builtin, opts)
map("n", "<leader>h", tb.help_tags, opts)
map("n", "<leader>b", tb.buffers, opts)

--  netrw
map("n", "<leader>jj", ":Ex<CR>", opts)

-- nvim-tree
map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- lsp
map("n", "<space>e", vd.open_float)
map("n", "[d", vd.goto_prev)
map("n", "]d", vd.goto_next)
map("n", "<space>q", vd.setloclist)

local function lsp_on_attach(ev)
  local buf_opts = vim.tbl_extend("force", opts, { buffer = ev.buf })

  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  map("n", "gD", vim.lsp.buf.declaration, buf_opts)
  map("n", "gd", vim.lsp.buf.definition, buf_opts)
  map("n", "K", vim.lsp.buf.hover, buf_opts)
  map("n", "gi", vim.lsp.buf.implementation, buf_opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, buf_opts)
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, buf_opts)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, buf_opts)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  map("n", "<space>D", vim.lsp.buf.type_definition, buf_opts)
  map("n", "<space>rn", vim.lsp.buf.rename, buf_opts)
  map("n", "<space>ca", vim.lsp.buf.code_action, buf_opts)
  map("n", "gr", vim.lsp.buf.references, buf_opts)
  map("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- autocommand to attach keymaps after LSP attaches
api.nvim_create_autocmd("LspAttach", {
  group = api.nvim_create_augroup("UserLspConfig", {}),
  callback = lsp_on_attach,
})
 
-- add vimtex keybindings later
