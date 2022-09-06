local defaults = require('slumber.lsp.defaults')
local root = vim.fs.find({ 'Package.swift', '.git' }, { upward = true })
if next(root) then
  vim.lsp.start({
    name = 'sourcekit-lsp',
    cmd = { 'sourcekit-lsp' },
    root_dir = vim.fs.dirname(root[1]),
    capabilities = defaults.capabilities,
  })
end
