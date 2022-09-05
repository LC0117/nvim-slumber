local root = vim.fs.find({ 'go.mod', 'go.work' }, { upward = true })
vim.lsp.start({
  name = 'gopls',
  cmd = { 'gopls' },
  root_dir = next(root) and vim.fs.dirname(root[1]) or vim.fn.getcwd(),
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
