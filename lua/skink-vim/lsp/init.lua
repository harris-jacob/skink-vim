require('skink-vim.lsp.providers')
require('skink-vim.lsp.diagnostics')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- border = config.border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    -- border = config.border,
})

vim.lsp.set_log_level("debug")
