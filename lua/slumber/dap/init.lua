local U = require('slumber.core.utils')
local path = U.path
local dap = require('dap')

-- define the breakpoints
vim.fn.sign_define('DapBreakpoint', { text = [[ ]], texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakPointCondition', { text = [[ ]], texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapBreakpointRejected', { text = [[ ]], texthl = 'DiagnosticError' })
vim.fn.sign_define('DapStopped', { text = [[ ]], texthl = 'String' })
vim.fn.sign_define('DapLogponit', { text = [[ ]], texthl = 'DapLogPoint' })

-- nvim-dap mappings
vim.keymap.set({ 'n', 'i' }, '<F2>', dap.toggle_breakpoint)
vim.keymap.set({ 'n', 'i' }, '<F5>', dap.continue)

dap.adapters.lldb = {
  type = 'executable',
  command = 'xcrun -r lldb-dap' and U.is_mac or 'lldb-dap',
  name = 'lldb',
}
dap.adapters.python = {
  type = 'executable',
  command = path.concat(U.mason_package, 'debugpy', 'venv', 'bin', 'python'),
  args = { '-m', 'debugpy.adapter' },
}
dap.adapters.dlv = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { 'dap', '-l', '127.0.0.1:' .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn('dlv', opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)
  vim.defer_fn(function()
    callback({ type = 'server', host = '127.0.0.1', port = port })
  end, 100)
end

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. path.sep, 'file')
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
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/opt/homebrew/bin/python3'
      end
    end,
  },
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    initCommands = function()
      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
      assert(vim.v.shell_error == 0, 'failed to get rust sysroot using `rustc --print sysroot`: ' .. rustc_sysroot)
      local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
      return {
        ([[!command script import '%s']]):format(script_file),
        ([[command source '%s']]):format(commands_file),
      }
    end,
  },
}

dap.configurations.go = {
  {
    type = 'dlv',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'dlv',
    name = 'Debug test',
    request = 'launch',
    mode = 'test',
    program = '${file}',
  },
  {
    type = 'dlv',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
}
