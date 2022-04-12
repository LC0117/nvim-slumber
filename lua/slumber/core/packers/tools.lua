local M = {}

M['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = function()
    require('slumber.plugins.finder')
  end,
}

M['mrjones2014/dash.nvim'] = {
  after = 'telescope.nvim',
  run = 'make install',
}

M['ray-x/guihua.lua'] = {
  event = 'BufRead',
  run = 'cd lua/fzy && make',
  config = function()
    require('guihua').setup()
  end,
}

M['nvim-telescope/telescope-file-browser.nvim'] = {
  opt = true,
  after = 'telescope.nvim',
  config = function()
    require('telescope').load_extension('file_browser')
  end,
}

M['nvim-telescope/telescope-fzf-native.nvim'] = {
  opt = true,
  run = 'make',
  after = 'telescope.nvim',
  config = function()
    require('telescope').load_extension('fzf')
  end,
}

M['stevearc/dressing.nvim'] = {
  event = 'BufRead',
  config = [[require('slumber.plugins.dressing')]],
}

M['kevinhwang91/nvim-hlslens'] = {
  event = 'BufRead',
  config = [[require('slumber.plugins.hlslens')]],
}

M['folke/todo-comments.nvim'] = {
  event = 'BufRead',
  config = function()
    require('todo-comments').setup()
  end,
}

M['akinsho/toggleterm.nvim'] = {
  cmd = { 'ToggleTerm' },
  config = [[require('slumber.plugins.toggleterm')]],
}

M['numToStr/Comment.nvim'] = {
  opt = true,
  after = 'nvim-ts-context-commentstring',
  config = [[require('slumber.plugins.comment')]],
}

M['hrsh7th/nvim-cmp'] = {
  event = 'InsertEnter',
  requires = {
    { 'lukas-reineke/cmp-under-comparator' },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      config = function()
        local tabnine = require('cmp_tabnine.config')
        tabnine:setup({ max_line = 1000, max_num_results = 20, sort = true })
      end,
      cmd = 'Tabnine',
    },
    {
      'L3MON4D3/LuaSnip',
      requires = { 'rafamadriz/friendly-snippets', event = 'BufRead' },
      after = 'friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').load()
      end,
    },
  },
  config = [[require('slumber.plugins.completion')]],
}

M['windwp/nvim-autopairs'] = {
  after = 'nvim-cmp',
  config = function()
    local pairs = require('nvim-autopairs.completion.cmp')
    require('cmp').event:on('confirm_done', pairs.on_confirm_done({ map_char = { tex = '', plaintex = '' } }))
    pairs.lisp[#pairs.lisp + 1] = 'racket'
    require('nvim-autopairs').setup({ map_cr = true })
  end,
}

M['karb94/neoscroll.nvim'] = {
  event = 'BufWinEnter',
  config = function()
    require('neoscroll').setup({
      hide_cursor = true,
      stop_eof = true,
    })
  end,
}

M['NvChad/nvim-colorizer.lua'] = {
  cmd = 'ColorizerToggle',
  config = function()
    require('colorizer').setup()
  end,
}

return M
