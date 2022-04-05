local defaults = require("slumber.lsp.defaults")
local M = {}

M.settings = {
  Lua = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    completion = { callSnippet = 'replace' },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
      maxPreload = 10000,
    },
  },
}

M.on_attach = defaults.on_attach

M.capabilities = defaults.capabilities

return M
