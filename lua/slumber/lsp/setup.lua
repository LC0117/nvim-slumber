local defaults = require('slumber.lsp.defaults')
local clients = {
  'zls',
  'lemminx',
  'sorbet',
  'taplo',
  'vue_ls',
  'ty',
  'groovyls',
  'clojure_lsp',
  'qmlls',
  'neocmake',
  'html',
  'cssls',
  'ruff',
  'mesonlsp',
  'ruby_lsp',
  'clangd',
  'ts_ls',
  'gopls',
  'rust_analyzer',
  'kotlin_lsp',
  'ltex_plus',
}

for _, lsp in ipairs(clients) do
  vim.lsp.config(lsp, { capabilities = defaults.capabilities })
  vim.lsp.enable(lsp)
end

vim.lsp.config('lua_ls', {
  capabilities = defaults.capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' },
        disable = { 'different-requires', 'undefined-field' },
      },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      hint = { enable = true, setType = true },
      format = { enable = false },
      telemetry = { enable = false },
      semantic = { enable = false },
    },
  },
})
vim.lsp.enable('lua_ls')

local uv = vim.uv
local fs = vim.fs
local U = require('slumber.core.utils')

local function roslyn_cmd()
  local roslyn_path = fs.joinpath(vim.fn.stdpath('data'), 'mason', 'bin', 'roslyn')
  local mason_cmd = U.is_windows and string.format('%s.cmd', roslyn_path) or roslyn_path
  local rzls_path = fs.joinpath(vim.fn.stdpath('data'), 'mason', 'packages', 'rzls', 'libexec')
  return {
    mason_cmd,
    '--stdio',
    '--logLevel=Information',
    '--extensionLogDirectory=' .. fs.joinpath(uv.os_tmpdir(), 'roslyn_ls/logs'),
    '--razorSourceGenerator=' .. fs.joinpath(rzls_path, 'Microsoft.CodeAnalysis.Razor.Compiler.dll'),
    '--razorDesignTimePath=' .. fs.joinpath(rzls_path, 'Targets', 'Microsoft.NET.Sdk.Razor.DesignTime.targets'),
    '--extension',
    fs.joinpath(rzls_path, 'RazorExtension', 'Microsoft.VisualStudioCode.RazorExtension.dll'),
  }
end
vim.lsp.config('roslyn_ls', {
  cmd = roslyn_cmd(),
  capabilities = defaults.capabilities,
})
vim.lsp.enable('roslyn_ls')

vim.lsp.config('jsonls', {
  capabilities = defaults.capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.lsp.enable('jsonls')

vim.lsp.config('yamlls', {
  capabilities = defaults.capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = '',
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})
vim.lsp.enable('yamlls')

vim.lsp.config('sourcekit', {
  filetypes = { 'swift' }
})
vim.lsp.enable('sourcekit')
