if vim.fn.has('nvim-0.7') == 0 then
    error('Neovim 0.7+ is required to run skink-vim!')
end

do
    local ok, _ = pcall(require, 'impatient')

    if not ok then
        vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
    end
end

local ok, err = pcall(require, 'skink-vim')

if not ok then
    error(('Error loading core...\n\n%s'):format(err))
end
