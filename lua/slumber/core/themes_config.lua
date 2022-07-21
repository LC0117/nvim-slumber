local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if catppuccin_ok then
  local options = {
    term_colors = true,
    styles = {
      comments = { 'italic' },
      functions = { 'italic' },
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
          warnings = { 'undercurl' },
          information = { 'underline' },
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
      dap = {
        enabled = true,
        enable_ui = true,
      },
    },
  }
  catppuccin.setup(options)
end

local onedarkpro_ok, onedarkpro = pcall(require, 'onedarkpro')
if onedarkpro_ok then
  onedarkpro.setup({
    dark_theme = 'onedark_vivid',
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
end

vim.g.catppuccin_flavour = 'mocha'
vim.cmd('colorscheme catppuccin')
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    vim.cmd('Catppuccin ' .. (vim.v.option_new == 'light' and 'latte' or 'mocha'))
  end,
})
