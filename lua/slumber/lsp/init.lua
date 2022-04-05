vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
  virtual_text = {
      prefix = '🙉🏻',
    format = function(diagnostic)
      if diagnostic.severity == severity.ERROR then
        return string.format('❗️ERROR: %s', diagnostic.message)
      elseif diagnostic.severity == severity.HINT or diagnostic.severity == severity.INFO then
        return string.format('👀NOTE: %s', diagnostic.message)
      elseif diagnostic.severity == severity.WARN then
        return string.format('🚀WARNING: %s', diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

local lsp_signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = '',
}

for type, icon in pairs(lsp_signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

require('slumber.lsp.installer')
require('slumber.lsp.setup')
