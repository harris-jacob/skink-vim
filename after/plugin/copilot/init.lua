  -- vim.g.copilot_assume_mapped = true
  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', {silent = true, expr = true, desc = "Copilot accept suggestion" })
