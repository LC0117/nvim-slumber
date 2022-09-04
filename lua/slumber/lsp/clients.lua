local lsp = vim.api.nvim_create_augroup('LSP', { clear = true })
local defaults = require('slumber.lsp.defaults')

-- clangd client setting
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  callback = function()
    local root = vim.fs.find({
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      '.git',
    }, { upward = true })
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd', '--background-index', '-j=12', '--clang-tidy', '--completion-style=detailed' },
      root_dir = vim.fs.dirname(root[1]),
      capabilities = defaults.capabilities,
    })
  end,
})

-- jsonls setup
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = { 'json', 'jsonc' },
  callback = function()
    local root = vim.fs.find({ '.git' }, { upward = true })
    vim.lsp.start({
      name = 'jsonls',
      cmd = { 'vscode-json-language-server', '--stdio' },
      init_options = {
        provideFormatter = false,
      },
      root_dir = next(root) and vim.fs.dirname(root[1]) or vim.fn.getcwd(),
      capabilities = defaults.capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
})
