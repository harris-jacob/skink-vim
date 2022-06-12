local default_on_attach = require('skink-vim.lsp.providers.defaults').on_attach
local U = require('skink-vim.utils')
local M = {}

function M.on_attach(client, bufnr)

end


function M.is_installed()
  -- TODO find nvim config path dynamically
  files = U.scandir("~/.config/nvim/bin/elixir-ls")
  if !U.has_value("language_server.sh") then
    vim.notify("you must install elixirls to the bin/ directory", vim.log.levels.WARN)
  end
end


return M
