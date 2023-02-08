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
  ['simrat39/rust-tools.nvim'] = {
    ft = 'rust',
    config = function()
      local defaults = require('slumber.lsp.defaults')
      local U = require('slumber.core.utils')
      local mason_home = U.path.concat(vim.fn.stdpath('data'), 'mason', 'packages')
      local codelldb_path = U.path.concat(mason_home, 'codelldb', 'extension', 'adapter', 'codelldb')
      local liblldb_name = U.is_linux and 'liblldb.so' or U.is_mac and 'liblldb.dylib' or U.is_windows and 'liblldb.dll'
      local liblldb_path = U.path.concat(mason_home, 'codelldb', 'extension', 'lldb', 'lib', liblldb_name)
      local opts = {
        tools = {
          executor = require('rust-tools/executors').termopen,
          on_initialized = nil,
          inlay_hints = {
            auto = false,
          },
          hover_actions = {
            border = {
              { '╭', 'FloatBorder' },
              { '─', 'FloatBorder' },
              { '╮', 'FloatBorder' },
              { '│', 'FloatBorder' },
              { '╯', 'FloatBorder' },
              { '─', 'FloatBorder' },
              { '╰', 'FloatBorder' },
              { '│', 'FloatBorder' },
            },
            auto_focus = true,
          },
          crate_graph = {
            backend = 'svg',
            output = nil,
            full = true,
          },
        },
        server = {
          capabilities = defaults.capabilities,
          on_attach = defaults.on_attach,
          standalone = true,
          settings = {
            ['rust-analyzer'] = {
              imports = {
                granularity = {
                  group = 'module',
                },
                prefix = 'self',
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
              checkOnSave = {
                command = 'clippy',
                features = 'all',
              },
            },
          },
        },
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
      require('rust-tools').setup(opts)
    end,
  },
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
}
