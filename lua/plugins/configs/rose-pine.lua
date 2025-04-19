require('rose-pine').setup({
  --- 'auto'|'main'|'moon'|'dawn'
  variant = 'auto',
  ---  'main'|'moon'|'dawn'
  dark_variant = 'main',
  light_variant= 'dawn',
  bold_vert_split = true,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
  --- string hex value or named color from rosepinetheme.com/palette
  styles = {
  },
  groups = {
    panel = 'surface',
    panel_nc = 'base',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = 'rose' },

    -- Blend colours against the "base" background
    CursorLine = { bg = 'foam', blend = 10 },
    StatusLine = { fg = 'love', bg = 'love', blend = 10 },

    -- By default each group adds to the existing config.
    -- If you only want to set what is written in this config exactly,
    -- you can set the inherit option:
    Search = { bg = 'gold', inherit = false },
  }
})

vim.cmd.colorscheme("rose-pine")
