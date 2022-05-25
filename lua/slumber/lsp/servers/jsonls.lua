local defaults = require('slumber.lsp.defaults')
local M = {}

M.on_attach = defaults.on_attach

M.capabilities = defaults.capabilities

M.settings = {
  json = {
    schemas = require('schemastore').json.schemas(),
    validate = { enable = true }
  },
}

return M
