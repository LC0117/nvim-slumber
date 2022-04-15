local M = {}

M['nvim-lualine/lualine.nvim'] = {
  after = 'aerial.nvim',
  config = [[require('slumber.plugins.lualine')]],
}

M['lewis6991/gitsigns.nvim'] = {
  event = { 'BufRead', 'BufNewFile' },
  config = [[require('slumber.plugins.gitsigns')]],
}

M['j-hui/fidget.nvim'] = {
  config = function()
    require('fidget').setup({
      text = {
        spinner = 'moon',
      },
      window = {
        blend = 0,
      },
    })
  end,
}

M['akinsho/bufferline.nvim'] = {
  event = 'BufRead',
  config = [[require('slumber.plugins.bufferline')]],
}

M['nvim-neo-tree/neo-tree.nvim'] = {
  branch = 'v2.x',
  cmd = 'Neotree',
  setup = [[vim.g.neo_tree_remove_legacy_commands = 1]],
  config = [[require('slumber.plugins.filetree')]],
}

M['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufWinEnter',
  setup = function ()
    vim.g.indent_blankline_filetype_exclude = {
        "lspinfo", "packer", "checkhealth", "help", "man",
        "aerial", "neo-tree", "nvim-lsp-installer", ""
    }
    vim.g.indent_blankline_buftype_exclude = {
        "terminal", "nofile", "quickfix", "Scrach"
    }
  end,
  config = function()
    require('indent_blankline').setup({
      show_current_context = true,
      show_current_context_start = true,
      space_char_blankline = ' ',
    })
  end,
}

return M
