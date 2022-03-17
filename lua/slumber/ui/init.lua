local M = {}

function M.cupcin()
  require('slumber.ui.cupcin')
end

function M.onedarkpro()
  require('onedarkpro').setup({
    styles = {
      comments = 'italic',
      keywords = 'bold,italic',
      functions = 'italic',
    },
    options = {
      bold = true,
      italic = true,
      underline = true,
      undercurl = true,
      cursorline = true,
      terminal_colors = true,
    },
  })
  require('onedarkpro').load()
end

-- function M.tokyo()
--     vim.g.tokyonight_transparent = false
--     vim.g.tokyonight_transparent_sidebar = false
--     vim.g.tokyonight_style = "night"
--     vim.g.tokyonight_italic_functions = true
--     if vim.fn.has("gui_vimr") == 1 or vim.fn.has("neovide") == 1 then
--         vim.g.tokyonight_transparent = false
--         vim.g.tokyonight_transparent_sidebar = false
--     end
-- end

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
        keywords = 'bold',
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
