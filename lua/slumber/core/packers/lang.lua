local M = {}

M['nvim-treesitter/nvim-treesitter'] = {
  requires = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', opt = true, after = 'nvim-treesitter' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', opt = true, after = 'nvim-treesitter' },
    { 'p00f/nvim-ts-rainbow', opt = true, after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', opt = true, after = 'nvim-treesitter' },
    {
      'andymass/vim-matchup',
      opt = true,
      after = 'nvim-treesitter',
      setup = function()
        vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
      end,
    },
    { 'nvim-treesitter/nvim-treesitter-refactor', opt = true, after = 'nvim-treesitter' },
    {
      'romgrk/nvim-treesitter-context',
      opt = true,
      after = 'nvim-treesitter',
      config = [[require('slumber.plugins.treesitter.context')]],
    },
  },
  event = 'BufRead',
  config = [[require('slumber.plugins.treesitter')]],
}

M['neovim/nvim-lspconfig'] = {
  event = 'BufRead',
  requires = {
    { 'jose-elias-alvarez/null-ls.nvim', after = 'nvim-lspconfig', config = [[require('slumber.lsp.null_ls')]] },
    { 'williamboman/nvim-lsp-installer' },
    { 'stevearc/aerial.nvim', after = 'nvim-treesitter', config = [[require('slumber.plugins.aerial')]] },
    { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig', config = [[require('slumber.plugins.lsp_signature')]] },
    { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
    { 'b0o/schemastore.nvim' },
    { 'p00f/clangd_extensions.nvim', after = 'nvim-lspconfig', config = [[require('slumber.lsp.servers.clangd')]] },
    { 'ray-x/go.nvim', ft = 'go', config = [[require('slumber.lsp.servers.go')]] },
    {
      'simrat39/rust-tools.nvim',
      ft = 'rust',
      config = [[require('slumber.lsp.servers.rust_analyzer')]],
    },
  },
  config = [[require('slumber.lsp')]],
}

M['vuki656/package-info.nvim'] = {
  event = 'BufEnter package.json',
  config = function()
    require('package-info').setup()
  end,
}

M['akinsho/flutter-tools.nvim'] = {
  ft = 'dart',
  config = [[require('slumber.lsp.servers.flutter')]],
}

M['ionide/Ionide-vim'] = {
  ft = { 'fsharp', 'fs', 'fsi', 'fsx' },
}

M['mfussenegger/nvim-dap'] = {
  event = 'BufRead',
  requires = {
    { 'rcarriga/nvim-dap-ui', after = 'nvim-dap', config = [[require('slumber.plugins.dap.ui')]] },
    { 'theHamsta/nvim-dap-virtual-text', after = 'nvim-dap', config = [[require('slumber.plugins.dap.virtual')]] },
  },
}

M['Saecki/crates.nvim'] = {
  after = 'nvim-cmp',
  config = function()
    require('crates').setup()
    local cmp = require('cmp')
    local config = cmp.get_config()
    table.insert(config.sources, { name = 'crates' })
    cmp.setup(config)
  end,
}

return M
