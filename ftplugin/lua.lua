local opt = vim.opt

opt.shiftwidth = 2
opt.tabstop = 2

local path = vim.fs.find({ 'stylua.toml', '.git' })
local root_dir = next(path) and vim.fs.dirname(path[1]) or vim.fn.getcwd()
vim.lsp.start({
  name = 'lua-language-server',
  cmd = { 'lua-language-server' },
  root_dir = root_dir,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      completion = { callSnippet = 'replace' },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 10000,
      },
    },
  },
})
