local nlsp = require('lspconfig')
local defaults = require('slumber.lsp.defaults')

local clients = {
  'clangd',
  'hls',
  'gopls',
  'zls',
  'r_language_server',
  'pylsp',
  'ocamllsp',
  'rust_analyzer',
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
