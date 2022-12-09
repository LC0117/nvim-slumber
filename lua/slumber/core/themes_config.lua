local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if catppuccin_ok then
  local options = {
    dim_inactive = {
      enabled = false,
    },
    flavour = vim.env.TERM_THEME == 'light' and 'latte' or 'mocha',
    background = { light = 'latte', dark = 'mocha' },
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
  }
  catppuccin.setup(options)
end

local fox_ok, fox = pcall(require, 'nightfox')
if fox_ok then
  fox.setup({
    options = {
      styles = {
        comments = 'italic',
        functions = 'italic',
        keywords = 'bold,italic',
      },
    },
  })
end

local odp_ok, odp = pcall(require, 'onedarkpro')
if odp_ok then
  odp.setup({
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
  })
end

local kngw_ok, kngw = pcall(require, 'kanagawa')
if kngw_ok then
  kngw.setup({
    undercurl = true,
    globalStatus = true,
    theme = 'default',
  })
end

local tky_ok, tky = pcall(require, 'tokyonight')
if tky_ok then
  tky.setup({
    style = 'moon',
    styles = {
      keywords = { italic = true, bold = true },
      functions = { italic = true },
    },
  })
end

vim.api.nvim_command('colo catppuccin')

