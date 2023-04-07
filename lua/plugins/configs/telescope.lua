local actions = require("telescope.actions")
local A = vim.api
require("telescope").setup({
    defaults = {
        prompt_prefix = " ❯ ",
        initial_mode = "insert",
        sorting_strategy = "descending",
        layout_config = { prompt_position = "bottom" },
        file_ignore_patterns = {
            ".git/", "node_modules", ".cache", "%.o", "%.a", "%.out", "%.class",
            "%.pdf", "%.mkv", "%.mp4", "%.zip"
        },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<TAB>"] = actions.toggle_selection +
                    actions.move_selection_next,
                ["<C-s>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case"        -- "smart_case" | "ignore_case" | "respect_case"
        }
    }
})

_G.Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == "NvimTree" then
            A.nvim_cmd({ cmd = "wincmd", args = { "l" } }, {})
        end
        return require("telescope.builtin")[k]
    end
})

-- fuzzy finder keymaps
vim.keymap.set("n", "<C-P>",
    "<CMD>lua Telescope.find_files({ hidden = true })<CR>")
vim.keymap.set("n", "<leader>H", "<CMD>lua Telescope.help_tags()<CR>")
vim.keymap.set("n", "'b", "<CMD>lua Telescope.buffers()<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>lua Telescope.live_grep()<CR>")
vim.keymap.set("n", "'c", "<CMD>lua Telescope.git_status()<CR>")
vim.keymap.set("n", "<leader>jj", "<CMD>E<CR>")
