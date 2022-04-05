local M = {}

M['wbthomason/packer.nvim'] = {}

M['lewis6991/impatient.nvim'] = {}

M['nvim-lua/plenary.nvim'] = {}

M['nvim-lua/popup.nvim'] = {
  event = 'BufWinEnter',
}

M['MunifTanjim/nui.nvim'] = {
  event = 'BufWinEnter',
}

M['kyazdani42/nvim-web-devicons'] = {
  event = 'BufWinEnter',
}

M['startup-nvim/startup.nvim'] = {
  config = [[require('slumber.plugins.startboard')]],
}

M['rcarriga/nvim-notify'] = {
  config = [[require('slumber.plugins.notify')]],
}

return M
