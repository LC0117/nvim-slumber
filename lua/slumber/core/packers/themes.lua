local M = {}
local colors = require('slumber.core.themes_config')

M['catppuccin/nvim'] = {
  as = 'catppuccin',
  config = colors.catppuccin,
}

M['shaunsingh/nord.nvim'] = {}

M['EdenEast/nightfox.nvim'] = { config = colors.nightfox }

M['rose-pine/neovim'] = { config = colors.rose_pine }

M['rebelot/kanagawa.nvim'] = { config = colors.kanagawa }

M['olimorris/onedarkpro.nvim'] = { config = colors.onedarkpro }

M['marko-cerovac/material.nvim'] = { config = colors.material }

M['folke/tokyonight.nvim'] = { setup = [[vim.g.tokyonight_italic_functions = true]] }

return M
