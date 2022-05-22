local modules = {
    'skink-vim.compiled',
    'skink-vim.core',
    'skink-vim.lsp'
}

for _, mod in ipairs(modules) do
    local ok, err = pcall(require, mod)
    if mod == 'skink-vim.compiled' and not ok then
        vim.notify('Run :PackerCompile!', vim.log.levels.WARN)
    elseif not ok then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
