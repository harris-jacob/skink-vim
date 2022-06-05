local g = vim.g
local icons = require('skink-vim.theme.icons')

-- settings
g.nvim_tree_refresh_wait = 300


-- set up args
local args = {
    respect_buf_cwd = true,
    diagnostics = {
        enable = true,
      icons = {
        hint = icons.hint,
        info = icons.info,
        warning = icons.warn,
        error = icons.error,
      }
    },
    ignore_ft_on_setup = {
        'startify',
        'dashboard',
        'alpha',
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        signcolumn = "no",
        width = 35,
        number = true,
        relativenumber = true,
    },
    renderer = {
      highlight_git = true,
      icons = {
        glyphs = {
          default = '',
          symlink = icons.symlink,
          git = icons.git,
          folder = icons.folder,
      }
    }
  }
}

require('nvim-tree').setup(args)
