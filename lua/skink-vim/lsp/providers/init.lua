local lsp_installer = require('nvim-lsp-installer')

-- import providers
local providers = {
    tsserver = require("skink-vim.lsp.providers.tsserver")
}

-- global settings
lsp_installer.settings({
    ui = {
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = 'i',
            -- Keymap to install a server
            install_server = '<CR>',
            -- Keymap to reinstall/update a server
            update_server = 'u',
            -- Keymap to uninstall a server
            uninstall_server = 'x',
        },
    },
})

-- add servers here
local servers = { 'tsserver' }

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = providers[lsp].on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
