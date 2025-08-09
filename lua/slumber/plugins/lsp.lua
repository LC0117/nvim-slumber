return {
  ['neovim/nvim-lspconfig'] = {
    event = 'BufReadPre',
    dependencies = { 'b0o/schemastore.nvim' },
    config = function()
      require('slumber.lsp')
    end,
  },
  ['williamboman/mason.nvim'] = {
    cmd = 'Mason',
    opts = {
      ui = {
        icons = {
          package_installed = ' ',
          package_pending = '󰋇 ',
          package_uninstalled = ' ',
        },
      },
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    },
  },
  ['mfussenegger/nvim-jdtls'] = {
      ft = { 'java' }
  },
  ['nvimdev/lspsaga.nvim'] = {
    event = 'BufRead',
    opts = function()
      return {
        ui = {
          border = 'rounded',
          kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
        },
        lightbulb = {
          sign = false,
        },
      }
    end,
  },
  ['nvimtools/none-ls.nvim'] = {
    event = 'BufRead',
    config = function()
      local null_ls = require('null-ls')
      local formatters = null_ls.builtins.formatting
      null_ls.setup({
        sources = {
          formatters.stylua,
        },
      })
    end,
  },
}
