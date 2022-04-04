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
      'haringsrob/nvim_context_vt',
      opt = true,
      after = 'nvim-treesitter',
      config = [[require('slumber.plugins.treesitter.context_vt')]],
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
  },
  config = [[require('slumber.lsp')]],
}

M['JuliaEditorSupport/julia-vim'] = {}

M['vuki656/package-info.nvim'] = {
  event = 'BufEnter package.json',
  config = function()
    require('package-info').setup()
  end,
}

M['ionide/Ionide-vim'] = {
  ft = { 'fsharp', 'fs', 'fsi', 'fsx' },
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
