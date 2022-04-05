local defaults = require('slumber.lsp.defaults')
local debugger_dir = vim.fn.stdpath('cache') .. '/dart-code'
local debugger_path = debugger_dir .. '/out/dist/debug.js'

require('flutter-tools').setup({
  ui = {
    border = 'rounded',
    notification_style = 'native',
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = false,
    register_configurations = function()
      local dap = require('dap')
      dap.adapters.dart = {
        type = 'executable',
        command = 'node',
        args = { debugger_path, 'flutter' },
      }
    end,
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = 'ErrorMsg',
    prefix = '>',
    enabled = true,
  },
  dev_log = {
    enabled = true,
    open_cmd = 'tabedit',
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = false,
  },
  outline = {
    open_cmd = '30vnew',
    auto_open = false,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      foreground = false,
      virtual_text = true,
      virtual_text_str = '■',
    },
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {},
    },
  },
})
