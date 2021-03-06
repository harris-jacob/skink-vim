local _, colors = pcall(require, 'skink-vim.defaults.colors')
if not colors then
    return
end

local get_highlight = require('skink-vim.theme.utils').get_highlight
local set_highlight = require('skink-vim.theme.utils').set_highlight
local statusline_colors = get_highlight('StatusLine')
local error_colors = get_highlight('DiagnosticError')
local warning_colors = get_highlight('DiagnosticWarn')
local hint_colors = get_highlight('DiagnosticHint')
local info_colors = get_highlight('DiagnosticInfo')

vim.g.edge_transparent_background = 1

set_highlight('DiagnosticErrorInv', {
    guibg = error_colors.guifg,
    guifg = statusline_colors.guibg,
})

set_highlight('DiagnosticWarnInv', {
    guibg = warning_colors.guifg,
    guifg = statusline_colors.guibg,
})

set_highlight('DiagnosticHintInv', {
    guibg = hint_colors.guifg,
    guifg = statusline_colors.guibg,
})

set_highlight('DiagnosticInfoInv', {
    guibg = info_colors.guifg,
    guifg = statusline_colors.guibg,
})
