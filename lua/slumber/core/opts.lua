local function bind(options)
  for k, v in pairs(options) do
    if v == true then
      vim.cmd('set ' .. k)
    elseif v == false then
      vim.cmd('set no' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

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
  viewoptions = 'folds,cursor,curdir,slash,unix',
  laststatus = 3,
  backup = false,
  writebackup = false,
  swapfile = false,
  cursorline = true,
  showtabline = 2,
  showbreak = '↳  ',
  listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
  backspace = 'indent,eol,start',
  updatetime = 150,
  shell = '/opt/homebrew/bin/zsh',
}

local binds = {
  undofile = true,
  synmaxcol = 2500,
  formatoptions = '1jcroql',
  expandtab = true,
  autoindent = true,
  number = true,
  linebreak = true,
  conceallevel = 0,
  concealcursor = 'niv',
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = -1,
  relativenumber = true,
}

local function mkwork()
  vim.cmd([[filetype plugin indent on]])
  vim.g.python3_host_prog = '/usr/bin/python3'
  for k, v in pairs(options) do
    vim.o[k] = v
  end
  bind(binds)
end

mkwork()
