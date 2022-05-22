local default_on_attach = require('skink-vim.lsp.providers.defaults').on_attach
local M = {}

function M.on_attach(client, bufnr)
    default_on_attach(client, bufnr)

    local ts_utils = require('nvim-lsp-ts-utils')


    -- defaults
    ts_utils.setup({
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- inlay hints
        auto_inlay_hints = true,
        inlay_hints_highlight = 'Comment',

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = false,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},
    })

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)
end

return M
