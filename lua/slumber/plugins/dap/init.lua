local dapers = vim.fn.stdpath('data') .. '/dapers'
local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', { text = [[]], texthl = 'DiagnosticWarning' })
vim.fn.sign_define('DapBreakPointCondition', { text = [[]], texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DapBreakpointRejected', { text = [[]], texthl = 'DiagnosticError' })
vim.fn.sign_define('DapStopped', { text = [[]], texthl = 'DiagnosticHint' })
vim.fn.sign_define('DapLogponit', { text = [[]], texthl = 'String' })

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = dapers .. '/vscode-node-debug2/out/src/nodeDebug.js',
}
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode',
  name = 'lldb',
}
dap.adapters.python = {
  type = 'executable',
  command = vim.env.HOME .. '/.local/opt/virtualenvs/debugpyenv/bin/python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
    postRunCommands = { 'process handle -p true -s false -n false SIGWINCH' },
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.python = {
  {
    name = 'Launch file',
    type = 'python',
    request = 'launch',
    program = '${file}',
    pythonPath = function ()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/opt/homebrew/bin/python3'
      end
    end
  }
}
