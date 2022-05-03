local os_name = vim.loop.os_uname().sysname
local M = {}

M.is_mac = os_name == 'Darwin'
M.is_linux = os_name == 'Linux'
M.is_windows = os_name == 'Windows_NT'
M.is_gui = vim.g.neovide or vim.fn.has('gui_vimr') == 1

M.path = {}
M.path.sep = (function()
  if M.is_windows then
    return '\\'
  else
    return '/'
  end
end)()
function M.path.concat(components)
  return table.concat(components, M.path.sep)
end

return M
