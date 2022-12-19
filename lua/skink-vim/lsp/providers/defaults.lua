local register = require('skink-vim.lsp.functions').register

local M = {}

function M.on_attach(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable omni func completion (<c-x><c-o>)
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Register autocommands
    if client.server_capabilities.document_formatting then
        register()
    end

    -- disable defaults to avoid conflict
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    -- Add key mappings
    require('skink-vim.lsp.mappings').init(client, bufnr)

end

return M
