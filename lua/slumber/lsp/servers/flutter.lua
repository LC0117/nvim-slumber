local defaults = require('slumber.lsp.defaults')

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
