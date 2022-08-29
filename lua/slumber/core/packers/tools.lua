local M = {}

M['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = function()
    require('slumber.plugins.finder')
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
  after = 'telescope.nvim',
  config = [[require('slumber.plugins.dressing')]],
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
    local cmp = require('cmp')
    local handlers = require('nvim-autopairs.completion.handlers')
    local pairs = require('nvim-autopairs.completion.cmp')
    require('nvim-autopairs').setup({
      map_cr = true,
      disable_filetype = { 'TelescopePrompt' },
    })
    require('cmp').event:on(
      'confirm_done',
      pairs.on_confirm_done({
        filetypes = {
          ['*'] = {
            ['('] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
              handler = handlers['*'],
            },
          },
          tex = false,
          plaintex = false,
          haskell = false,
        },
      })
    )
  end,
}

M['brenoprata10/nvim-highlight-colors'] = {
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('nvim-highlight-colors').setup({
      render = 'background',
      enable_tailwind = true,
    })
  end,
}

M['declancm/cinnamon.nvim'] = {
  event = 'BufWinEnter',
  config = function()
    require('cinnamon').setup({
      default_keymaps = true,
      extra_keymaps = true,
      extended_keymaps = true,
    })
  end,
}

return M
