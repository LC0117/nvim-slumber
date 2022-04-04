local lsp_installer = require('nvim-lsp-installer')
local nlsp = require('lspconfig')
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}
capabilities.workspace.configuration = true
capabilities.offsetEncoding = { 'utf-16' }
vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = '',
      server_pending = '',
      server_uninstalled = '',
    },
  },
})

local function custom_attach(client, bufnr)
  require('aerial').on_attach(client, bufnr)
end

lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = custom_attach
  opts.capabilities = capabilities
  if server.name == 'sumneko_lua' then
    opts = require('slumber.lsp.servers.sumneko_lua')
    opts.on_attach = custom_attach
  elseif opts.name == 'tsserver' then
    opts = require('slumber.lsp.servers.tsserver')
  end
  server:setup(opts)
end)

-- These are servers easy to setup
local clients = {
  'clangd',
  'hls',
  'gopls',
  'zls',
  'volar',
  'solargraph',
  'r_language_server',
  'pylsp',
  'ocamllsp',
  'rust_analyzer',
}

for _, lsp in ipairs(clients) do
  nlsp[lsp].setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
end

nlsp.sourcekit.setup({
  filetypes = { 'swift' },
  on_attach = custom_attach,
  capabilities = capabilities,
})
