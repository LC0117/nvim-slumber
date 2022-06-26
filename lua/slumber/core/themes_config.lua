local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if catppuccin_ok then
  local options = {
    term_colors = true,
    styles = {
      comments = 'italic',
      functions = 'italic',
      keywords = 'italic,bold',
      strings = 'NONE',
      variables = 'NONE',
    },
    integrations = {
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
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      nvimtree = {
        enabled = false,
        show_root = false,
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      ts_rainbow = true,
    },
  }
  catppuccin.setup(options)
end

local onedarkpro_ok, onedarkpro = pcall(require, 'onedarkpro')
if onedarkpro_ok then
  onedarkpro.setup({
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
      window_unfocussed_color = false,
    },
  })
  require('onedarkpro').load()
end
