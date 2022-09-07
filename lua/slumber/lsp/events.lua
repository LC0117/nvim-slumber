local defaults = require('slumber.lsp.defaults')
vim.api.nvim_create_augroup('LspEvents', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspEvents',
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    defaults.on_attach(client, bufnr)
  end,
})
