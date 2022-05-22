local map = require('skink-vim.utils').map
local builtin = require('telescope.builtin')
local M = {}

M.project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then
        require('telescope.builtin').find_files(opts)
    end
end

M.edit_neovim = function()
    builtin.git_files {
        cwd              = "~/.config/nvim",
        prompt           = "~ dotfiles ~",
        color_devicons   = true,
        sorting_strategy = "ascending",
        layout_config    = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
            prompt_position = "top",
        },
    }
end

return M
