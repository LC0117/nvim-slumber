local os_name = vim.loop.os_uname().sysname
local M = {}

M.is_mac = os_name == 'Darwin'
M.is_linux = os_name == 'Linux'
M.is_windows = os_name == 'Windows_NT'

return M
