local function gui_no_trans()
  if vim.fn.exists('g:neovide') == 1 or vim.fn.has('gui_vimr') == 1 then
    return false
  else
    return true
  end
end

local no_gui = gui_no_trans()
local gui = not no_gui

-- colorscheme catppuccin
local options = {
  transparent_background = no_gui,
  term_colors = true,
  styles = {
    comments = 'italic',
    functions = 'italic',
    keywords = 'italic,bold',
    strings = 'NONE',
    variables = 'NONE',
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = 'italic,bold',
        hints = 'NONE',
        warnings = 'italic',
        information = 'NONE',
      },
      underlines = {
        errors = 'undercurl',
        hints = 'underline',
        warnings = 'undercurl',
        information = 'underline',
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = false,
      show_root = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = false,
    cmp = true,
  },
}
require('catppuccin').setup(options)

-- colorscheme onedarkpro
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
    transparency = no_gui,
  },
})
require('onedarkpro').load() --makes onedarkpro the default theme

-- kanagawa
require('kanagawa').setup({
  undercurl = true,
  commentStyle = 'italic',
  functionStyle = 'italic',
  keywordStyle = 'italic,bold',
  specialException = true,
  transparent = no_gui,
})

-- nightfox
require('nightfox').setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = 'italic',
      functions = 'italic',
      keywords = 'bold,italic',
    },
    transparent = no_gui,
  },
})

require('rose-pine').setup({
  dark_variant = 'moon',
  dim_nc_background = gui,
  disable_background = no_gui,
})

vim.g.vscode_transparent = 1 - vim.fn.exists('g:neovide') - vim.fn.has('gui_vimr')
