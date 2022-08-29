local os_name = vim.loop.os_uname().sysname
local M = {}

M.is_mac = os_name == 'Darwin'
M.is_linux = os_name == 'Linux'
M.is_windows = os_name == 'Windows_NT'
M.is_gui = vim.g.neovide or vim.fn.has('gui_vimr') == 1

M.path = {}
M.path.sep = M.is_windows and '\\' or '/'
function M.path.concat(components)
  return table.concat(components, M.path.sep)
end

M.mason_home = M.path.concat({vim.fn.stdpath('data'), 'mason'})
M.mason_bin = M.path.concat({M.mason_home, 'bin'})
M.mason_package = M.path.concat({M.mason_home, 'packages'})

return M
