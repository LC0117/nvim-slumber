return {
  ['neovim/nvim-lspconfig'] = {
    event = 'BufReadPre',
    dependencies = {
      'mason.nvim',
      { 'williamboman/mason-lspconfig.nvim', config = true },
      { 'lvimuser/lsp-inlayhints.nvim', config = true },
    },
    config = function()
      require('slumber.lsp')
    end,
  },
  ['williamboman/mason.nvim'] = {
    cmd = 'Mason',
    opts = {
      github = {
        download_url_template = 'https://hub.yzuu.cf/%s/releases/download/%s/%s',
      },
      ui = {
        icons = {
          package_installed = ' ',
          package_pending = ' ',
          package_uninstalled = ' ',
        },
      },
    },
  },
  ['jose-elias-alvarez/null-ls.nvim'] = {
    event = 'BufReadPre',
    opts = function()
      local bf = require('null-ls').builtins.formatting
      local bd = require('null-ls').builtins.diagnostics
      local ba = require('null-ls').builtins.code_actions
      local bc = require('null-ls').builtins.completion
      return {
        sources = {
          ba.eslint.with({
            condition = function(utils)
              return utils.root_has_file({ 'package.json', '.eslintrc.json', '.eslintrc.js' })
            end,
          }),
          ba.shellcheck,
          bf.black,
          -- cmake
          bf.cmake_format,
          -- kotlin
          bf.ktlint,
          -- latex
          bf.latexindent,
          -- sql
          bf.sqlfluff,
          bf.scalafmt,
          bf.shfmt,
          bf.stylua.with({
            condition = function(utils)
              return utils.root_has_file({ 'stylua.toml', '.stylua.toml' })
            end,
          }),
          bf.stylelint,
          bf.swiftformat,
          bf.qmlformat,
          bd.chktex,
          -- make file linter
          bd.checkmake,
          -- go linter
          bd.golangci_lint,
          -- add fish lint rules
          bd.fish,
          -- dockerfile helper
          bd.hadolint,
          -- qt
          bd.qmllint,
          -- shell script checker
          bd.shellcheck,
          -- kotlin linter
          bd.ktlint,
          -- css linter
          bd.stylelint,
          -- vimscript linter
          bd.vint,
          -- sql stuff
          bd.sqlfluff,
        },
      }
    end,
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
