local defaults = require('slumber.lsp.defaults')

local severity = vim.diagnostic.severity
require('go').setup({
  lsp_cfg = {
    capabilities = defaults.capabilities,
    on_attach = defaults.on_attach,
  },
  lsp_diag_virtual_text = {
    space = 0,
    prefix = '🙉',
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
