local os_name = vim.loop.os_uname().sysname
local M = {}

M.is_mac = os_name == 'Darwin'
M.is_linux = os_name == 'Linux'
M.is_windows = os_name == 'Windows_NT'
M.is_gui = vim.g.neovide or vim.fn.has('gui_vimr') == 1

local path_sep
if M.is_windows then
  path_sep = '\\'
else
  path_sep = '/'
end
M.path_sep = path_sep

M.servers_path = vim.fn.stdpath('data') .. path_sep .. 'lsp_servers'

return M
