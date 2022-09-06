local defaults = require('slumber.lsp.defaults')
local fs = vim.fs
local root = fs.find({
  '.git',
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'pyrightconfig.json',
}, { upward = true })
vim.lsp.start({
  name = 'pyright',
  cmd = { 'pyright-langserver', '--stdio' },
  root_dir = next(root) and fs.dirname(root[1]) or vim.fn.getcwd(),
  capabilities = defaults.capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
})
