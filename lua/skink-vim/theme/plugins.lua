local M = {}

M.supported_themes = {
    'tokyonight',
    'github'
}

function M.init(use, config)
    use({ -- color scheme
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.g.tokyonight_style = 'storm'
            vim.g.tokyonight_sidebars = { 'qf' }
            vim.cmd('color tokyonight')
        end,
        disable = config.theme ~= 'tokyonight',
    })


    use({
        'projekt0n/github-nvim-theme',
        as = 'github',
        config = function()
            require('github-theme').setup()
        end,
        disable = config.theme ~= 'github',
    })
end

return M
