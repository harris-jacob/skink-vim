local M = {}

function M.buf_map(bufnr, mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = M.merge(options, opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = M.merge(options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.merge(...)
    return vim.tbl_deep_extend('force', ...)
end

return M
