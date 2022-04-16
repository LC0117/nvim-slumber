local g_options = {
  mapleader = ' ',
  neovide_transparency = 0.9,
  neovide_remember_window_size = true,
  neovide_input_use_logo = true,
  neovide_cursor_vfx_mode = 'torpedo',
  neovide_cursor_unfocused_outline_width = 0.125,
}

local options = {
  termguicolors = true,
  mouse = 'a',
  errorbells = true,
  visualbell = true,
  hidden = true,
  fileformats = 'unix,mac,dos',
  magic = true,
  virtualedit = 'block',
  encoding = 'utf-8',
  laststatus = 3,
  backup = false,
  writebackup = false,
  swapfile = false,
  cursorline = true,
  showtabline = 2,
  showbreak = '↳  ',
  listchars = {
    tab = '❘-',
    trail = '·',
    lead = '·',
    extends = '»',
    precedes = '«',
    nbsp = '×',
  },
  backspace = { 'eol', 'indent', 'start' },
  updatetime = 150,
  autoindent = true,
  expandtab = true,
  shiftwidth = 4,
  smartindent = true,
  softtabstop = 4,
  tabstop = 4,
  undofile = true,
  redrawtime = 1500,
  number = true,
  relativenumber = true,
  ignorecase = true,
  guifont = 'OperatorMono Nerd Font:h12'
}

vim.cmd([[
filetype plugin indent on
]])
for k, v in pairs(g_options) do
  vim.g[k] = v
end
for k, v in pairs(options) do
  vim.opt[k] = v
end
