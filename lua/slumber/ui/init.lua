local M = {}

function M.lualine()
  require('slumber.ui.lualine')
end

function M.bufferline()
  require('slumber.ui.bufferline')
end

function M.gitsigns()
  require('slumber.ui.gitsigns')
end

function M.tree()
  require('slumber.ui.nvim_tree')
end

function M.blankline()
  require('slumber.ui.indentline')
end

return M
