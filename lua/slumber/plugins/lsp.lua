return {
  ['neovim/nvim-lspconfig'] = {
    event = 'BufReadPre',
    dependencies = {
      'mason.nvim',
      { 'williamboman/mason-lspconfig.nvim', config = true },
    },
    config = function()
      require('slumber.lsp')
    end,
  },
  ['williamboman/mason.nvim'] = {
    cmd = 'Mason',
    opts = {
      ui = {
        icons = {
          package_installed = ' ',
          package_pending = ' ',
          package_uninstalled = ' ',
        },
      },
    },
  },
  ['mfussenegger/nvim-jdtls'] = { lazy = false },
  ['scalameta/nvim-metals'] = { lazy = false },
  ['glepnir/lspsaga.nvim'] = {
    event = 'BufRead',
    opts = function()
      return {
        ui = {
          theme = 'round',
          colors = require('catppuccin.groups.integrations.lsp_saga').custom_colors(),
          kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
        },
      }
    end,
  },
  ['b0o/schemastore.nvim'] = {},
}
