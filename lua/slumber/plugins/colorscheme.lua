return {
  --colorscheme catppuccin
  ['catppuccin/nvim'] = {
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      dim_inactive = {
        enabled = false,
      },
      flavour = vim.env.TERM_THEME == 'light' and 'latte' or 'mocha',
      background = { light = 'latte', dark = 'mocha' },
      term_colors = true,
      styles = {
        comments = { 'italic' },
        functions = { 'bold' },
        keywords = { 'bold', 'italic' },
      },
      compile = {
        enabled = true,
      },
      integrations = {
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'bold', 'italic' },
            hints = { 'italic' },
            warnings = { 'bold' },
            information = {},
          },
          underlines = {
            errors = { 'undercurl' },
            hints = { 'underline' },
            warnings = { 'underdouble' },
            information = { 'underline' },
          },
        },
        neotree = true,
        nvimtree = false,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        dashboard = true,
        treesitter = true,
        treesitter_context = true,
        fidget = true,
        ts_rainbow = true,
        notify = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
        aerial = true,
        lsp_saga = true,
        vimwiki = true,
        mason = true,
        noice = true,
        neotest = true,
      },
    },
  },

  -- colorscheme onedarkpro
  ['olimorris/onedarkpro.nvim'] = {
    opts = {
      styles = {
        comments = 'italic',
        keywords = 'bold,italic',
        functions = 'italic',
      },
      options = {
        terminal_colors = true,
        cursorline = true,
        underline = true,
        undercurl = true,
      },
    },
  },
}
