local config = require('skink-vim.core.config')
local colors = {}
local mod = 'skink-vim.theme.defaults'
local supported_themes = require('skink-vim.theme.plugins')


for _, theme in pairs(supported_themes) do
    if theme == config.theme then
        colors = require(mod .. theme)
    end
end

if vim.tbl_isempty(colors) then
    return false
end

return colors
