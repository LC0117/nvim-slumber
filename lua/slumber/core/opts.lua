local font = 'Maple Mono NF CN:h12'

local g_options = {
  mapleader = ' ',
  neovide_opacity = 0.9,
  neovide_remember_window_size = true,
  neovide_input_use_logo = true,
  neovide_cursor_vfx_mode = 'torpedo',
  neovide_cursor_unfocused_outline_width = 0.125,
  neovide_underline_stroke_scale = 1.5,
  zig_fmt_autosave = 0,
}

local options = {
  termguicolors = true,
  cmdheight = 0,
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
  guifont = font,
  signcolumn = 'yes',
  -- winborder = 'rounded',
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
