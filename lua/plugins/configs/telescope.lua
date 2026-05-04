local ok, actions = pcall(require, "telescope.actions")
if not ok then
  print("Error loading telescope actions:", actions)
end

local telescope = require("telescope")

require("telescope").setup({
  defaults = {
    prompt_prefix = " ❯ ",
    initial_mode = "insert",
    sorting_strategy = "descending",
    layout_config = { prompt_position = "bottom" },
    file_ignore_patterns = {
      "^.git/",
      "^node_modules/",
      "^target/",
      "%.lock",
      "%.sqlite3",
      "%.log",
      "%.cache",
      "%.o",
      "%.a",
    },
    mappings = {
      i = {

        ["<ESC>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,

        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- "smart_case" | "ignore_case" | "respect_case"
    },
  },
})

pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")

_G.Telescope = setmetatable({}, {
  __index = function(_, key)
    return function(...)
      if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd l")
      end
      return builtin[key](...)
    end
  end,
})
