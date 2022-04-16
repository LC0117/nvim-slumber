local nlsp = require('lspconfig')
local defaults = require('slumber.lsp.defaults')

local clients = {
  'zls',
  'r_language_server',
  'ocamllsp',
}

for _, lsp in ipairs(clients) do
  nlsp[lsp].setup({
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
  })
end

nlsp.sourcekit.setup({
  filetypes = { 'swift' },
  on_attach = defaults.on_attach,
  capabilities = defaults.capabilities,
})
