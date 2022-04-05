local defaults = require('slumber.lsp.defaults')
local M = {}

M.capabilities = defaults.capabilities

function M.on_attach(client, bufnr)
  require('tailwind-highlight').setup(client, bufnr, {
    single_column = false,
    mode = 'background',
    debounce = 200,
  })
  defaults.on_attach(client, bufnr)
end

return M
