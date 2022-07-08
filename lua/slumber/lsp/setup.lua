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
  'sorbet',
  'cmake',
  'taplo',
  'volar',
  'pyright',
  'kotlin_language_server',
  'omnisharp',
  'vls',
  'groovyls',
  'clojure_lsp',
  'phpactor'
}

for _, lsp in ipairs(clients) do
  nlsp[lsp].setup({
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
  })
end

nlsp.denols.setup({
  on_attach = defaults.on_attach,
  capabilities = defaults.capabilities,
  root_dir = nlsp.util.root_pattern('deno.json'),
  init_options = {
    lint = true,
  },
})

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
      formattingProvider = 'stylish-haskell',
    },
  },
})

nlsp.texlab.setup(require('slumber.lsp.servers.texlab'))
nlsp.jsonls.setup(require('slumber.lsp.servers.jsonls'))
nlsp.sumneko_lua.setup(require('slumber.lsp.servers.sumneko_lua'))
nlsp.tsserver.setup(require('slumber.lsp.servers.tsserver'))
