local severity = vim.diagnostic.severity
vim.diagnostic.config({
  virtual_text = {
    prefix = [[ ]],
    format = function(diagnostic)
      if diagnostic.severity == severity.ERROR then
        return string.format('ERROR: %s', diagnostic.message)
      elseif diagnostic.severity == severity.HINT or diagnostic.severity == severity.INFO then
        return string.format('NOTE: %s', diagnostic.message)
      elseif diagnostic.severity == severity.WARN then
        return string.format('WARNING: %s', diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

local lsp_signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}

for type, icon in pairs(lsp_signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

local kinds = vim.lsp.protocol.CompletionItemKind
local icons = {
  Text = ' ',
  Method = ' ',
  Function = '',
  Constructor = ' ',
  Field = ' ',
  Variable = '',
  Class = ' ',
  Interface = ' ',
  Module = ' ',
  Property = 'ﰠ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = 'ﬦ',
  Struct = ' ',
  Event = '',
  Operator = ' ',
  TypeParameter = ' ',
}
for index, _ in pairs(kinds) do
  kinds[index] = icons[index]
end

require('mason').setup({
  ui = {
    icons = {
      package_installed = ' ',
      package_pending = ' ',
      package_uninstalled = ' ',
    },
  },
})

require('mason-lspconfig').setup()
require('lsp-inlayhints').setup()
require('slumber.lsp.setup')
require('slumber.lsp.events')

