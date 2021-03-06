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
    {
      'nvim-treesitter/nvim-treesitter-context',
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
    { 'williamboman/nvim-lsp-installer', event = 'BufWinEnter' },
    { 'stevearc/aerial.nvim', after = 'nvim-treesitter', config = [[require('slumber.plugins.aerial')]] },
    { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig', config = [[require('slumber.plugins.lsp_signature')]] },
    { 'jose-elias-alvarez/nvim-lsp-ts-utils', event = 'BufWinEnter' },
    { 'b0o/schemastore.nvim', event = 'BufWinEnter' },
    { 'p00f/clangd_extensions.nvim', after = 'nvim-lspconfig', config = [[require('slumber.lsp.servers.clangd')]] },
    { 'mfussenegger/nvim-jdtls', ft = 'java', config = [[require('slumber.lsp.servers.jdtls')]] },
    { 'scalameta/nvim-metals', ft = { 'scala', 'sbt' }, config = [[require('slumber.lsp.servers.metals')]] },
    {
      'simrat39/rust-tools.nvim',
      ft = 'rust',
      config = [[require('slumber.lsp.servers.rust_analyzer')]],
    },
    {
      'someone-stole-my-name/yaml-companion.nvim',
      ft = 'yaml',
      config = [[require('slumber.lsp.servers.yaml')]],
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
  event = 'BufWinEnter',
  requires = {
    { 'rcarriga/nvim-dap-ui', after = 'nvim-dap', config = [[require('slumber.plugins.dap.ui')]] },
    { 'theHamsta/nvim-dap-virtual-text', after = 'nvim-dap', config = [[require('slumber.plugins.dap.virtual')]] },
  },
  config = [[require('slumber.plugins.dap')]],
}

M['Saecki/crates.nvim'] = {
  after = 'nvim-cmp',
  config = function()
    require('crates').setup({
      null_ls = {
        enabled = true,
        name = 'crates.io',
      },
    })
    local cmp = require('cmp')
    local config = cmp.get_config()
    table.insert(config.sources, { name = 'crates' })
    cmp.setup(config)
  end,
}

M['akinsho/pubspec-assist.nvim'] = {
  event = 'BufRead pubspec.yaml',
  rocks = {
    {
      'lyaml',
      server = 'http://rocks.moonscript.org',
    },
  },
  config = function()
    require('pubspec-assist').setup()
  end,
}

M['f3fora/nvim-texlabconfig'] = {
  config = function()
    require('texlabconfig').setup()
  end,
  ft = { 'tex', 'plaintex', 'bib' },
  cmd = 'TexlabInverseSearch',
}

return M
