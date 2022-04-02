-- colorscheme catppuccin
local options = {
  transparent_background = false,
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
    transparency = false,
    window_unfocused_color = false,
  },
})

-- kanagawa
require('kanagawa').setup({
  undercurl = true,
  commentStyle = 'italic',
  functionStyle = 'italic',
  keywordStyle = 'italic,bold',
  specialException = true,
  transparent = false,
  dimInactive = false,
})

-- nightfox
require('nightfox').setup({
  options = {
    dim_inactive = false,
    styles = {
      comments = 'italic',
      functions = 'italic',
      keywords = 'bold,italic',
    },
    transparent = false,
  },
})

require('rose-pine').setup({
  dark_variant = 'moon',
  dim_nc_background = false,
  disable_background = false,
})

vim.g.material_style = "oceanic"
vim.g.tokyonight_italic_functions = true
require('material').setup({
  italics = {
    comments = true,
    keywords = false,
    functions = true,
    strings = false,
    variables = false,
  },
})

require('onedarkpro').load()
