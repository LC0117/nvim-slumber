local defaults = require('slumber.lsp.defaults')
local U = require('slumber.core.utils')
local mason_home = U.path.concat(vim.fn.stdpath('data'), 'mason', 'packages')
local codelldb_path = U.path.concat(mason_home, 'codelldb', 'extension', 'adapter', 'codelldb')
local liblldb_name = U.is_linux and 'liblldb.so' or U.is_mac and 'liblldb.dylib' or U.is_windows and 'liblldb.dll'
local liblldb_path = U.path.concat(mason_home, 'codelldb', 'extension', 'lldb', 'lib', liblldb_name)

local opts = {
  tools = {
    executor = require('rust-tools/executors').termopen,
    on_initialized = nil,
    inlay_hints = {
      auto = false,
    },
    hover_actions = {
      border = {
        { '╭', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╮', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '╯', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╰', 'FloatBorder' },
        { '│', 'FloatBorder' },
      },
      auto_focus = true,
    },
    crate_graph = {
      backend = 'dot',
      output = nil,
      full = true,
    },
  },
  server = {
    capabilities = defaults.capabilities,
    on_attach = defaults.on_attach,
    standalone = true,
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}

require('rust-tools').setup(opts)
