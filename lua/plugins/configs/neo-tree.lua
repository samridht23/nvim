require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "left",
    width = 45,
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    hijack_netrw_behavior = "open_current",
  },
})
