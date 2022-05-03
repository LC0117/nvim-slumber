local nlsp = require('lspconfig')
local defaults = require('slumber.lsp.defaults')
require('nvim-lsp-installer').setup({
  ui = {
    icons = {
      server_installed = '',
      server_pending = '',
      server_uninstalled = '',
    },
  },
})

local clients = {
  'zls',
  'r_language_server',
  'ocamllsp',
  'gopls',
  'lemminx',
  'solargraph',
  'cmake',
  'taplo',
  'volar',
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

nlsp.hls.setup({
  on_attach = defaults.on_attach,
  capabilities = defaults.capabilities,
  settings = {
    haskell = {
      formattingProvider = 'fourmolu',
    },
  },
})

nlsp.texlab.setup(require('slumber.lsp.servers.texlab'))
nlsp.jsonls.setup(require('slumber.lsp.servers.jsonls'))
nlsp.sumneko_lua.setup(require('slumber.lsp.servers.sumneko_lua'))
nlsp.tsserver.setup(require('slumber.lsp.servers.tsserver'))
