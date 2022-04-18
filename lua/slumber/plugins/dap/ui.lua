local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  sidebar = {
    elements = {
      {
        id = 'scopes',
        size = 0.25,
      },
      { id = 'breakpoints', size = 0.25 },
      { id = 'stacks', size = 0.25 },
      { id = 'watches', size = 0.25 },
    },
    size = 40,
    position = 'left',
  },
  tray = {
    elements = { 'repl' },
    size = 10,
    position = 'bottom',
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = 'rounded',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
})
