local M = {}

-- Required to close buffers nicely when nvim-tree is open
function M.close_buffer()
  local treeview = require('nvim-tree.view')
  local bufferline = require('bufferline')

  -- check if NvimTree window was open

  local bufferToDelete = vim.api.nvim_get_current_buf()


  if (treeview.is_visible()) then
    -- switch to previous buffer (tracked by bufferline)
    bufferline.cycle(-1)
  end

  -- delete initially open buffer
  vim.cmd('bdelete! ' .. bufferToDelete)
end


return M
