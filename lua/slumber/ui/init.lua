local M = {}

function M.blankline()
  require('slumber.ui.indent_blankline')
end

function M.fox()
  require('nightfox').setup({
    options = {
      dim_inactive = true,
      styles = {
        comments = 'italic',
        functions = 'italic',
        keywords = 'bold,italic',
      },
    },
  })
end

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

return M
