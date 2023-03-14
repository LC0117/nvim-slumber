local M = {}

M['nyoom-engineering/oxocarbon.nvim'] = {}

M['nvim-lualine/lualine.nvim'] = {
  after = 'aerial.nvim',
  config = [[require('slumber.plugins.lualine')]],
}

M['catppuccin/nvim'] = {
  as = 'catppuccin',
}

M['EdenEast/nightfox.nvim'] = {}

M['rebelot/kanagawa.nvim'] = {}

M['kaiuri/nvim-juliana'] = {}

M['olimorris/onedarkpro.nvim'] = {}

M['folke/tokyonight.nvim'] = {}

M['lewis6991/gitsigns.nvim'] = {
  event = { 'BufRead', 'BufNewFile' },
  config = [[require('slumber.plugins.gitsigns')]],
}

M['folke/noice.nvim'] = {
  event = 'VimEnter',
  config = function()
    require('noice').setup({
      presets = {
        lsp_doc_border = 'rounded',
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
  setup = function()
    vim.g.indent_blankline_filetype_exclude = {
      'lspinfo',
      'packer',
      'checkhealth',
      'help',
      'man',
      'aerial',
      'neo-tree',
      'nvim-lsp-installer',
      'dap-repl',
      '',
    }
    vim.g.indent_blankline_show_first_indent_level = false
    vim.g.indent_blankline_buftype_exclude = {
      'terminal',
      'nofile',
      'quickfix',
      'Scrach',
    }
  end,
  config = function()
    require('indent_blankline').setup({
      show_current_context = true,
      show_current_context_start = true,
      space_char_blankline = ' ',
      char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
      },
    })
  end,
}

return M
