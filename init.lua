if vim.fn.has('nvim-0.7') == 0 then
    error('Neovim 0.7+ is required to run skink-vim!')
end


local ok, err = pcall(require, 'skink-vim')

if not ok then
    error(('Error loading core...\n\n%s'):format(err))
end
