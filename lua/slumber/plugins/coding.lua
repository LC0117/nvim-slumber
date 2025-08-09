return {
  -- ['L3MON4D3/LuaSnip'] = {
  --   lazy = false,
  --   dependencies = {
  --     'rafamadriz/friendly-snippets',
  --     config = function()
  --       require('luasnip.loaders.from_vscode').lazy_load()
  --     end,
  --   },
  --   build = 'make install_jsregexp',
  --   opts = {
  --     history = true,
  --     delete_check_events = 'TextChanged',
  --   },
  -- },
  ['saghen/blink.cmp'] = {
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'xzbdmw/colorful-menu.nvim',
    },
    version = 'v1.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<ESC>'] = { 'hide', 'fallback' },
      },
      appearance = {
        nerd_font_variant = 'normal',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 10,
          window = {
            border = 'rounded',
          },
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          draw = {
            columns = { { 'label', gap = 1 }, { 'kind_icon', 'kind' }, { 'source_name' } },
            components = {
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
      cmdline = {
        completion = {
          menu = { auto_show = true },
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
        },
        sources = { 'buffer', 'cmdline' },
        keymap = {
          preset = 'cmdline',
        },
      },
      sources = {
        default = { 'lsp', 'buffer', 'snippets', 'path' },
        providers = {
          lsp = {
            name = '[LSP]',
          },
          buffer = {
            name = '[BUF]',
          },
          snippets = {
            name = '[Snip]',
          },
          path = {
            name = '[PATH]',
          },
        },
      },
    },
  },
  ['windwp/nvim-autopairs'] = { config = true },
  ['JoosepAlviste/nvim-ts-context-commentstring'] = {
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function ()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function (filetype, option)
        return option == 'commentstring'
          and require('ts_context_commentstring.internal').calculate_commentstring()
          or get_option(filetype, option)
      end
    end
  },
  ['windwp/nvim-ts-autotag'] = {
    dependencies = { 'nvim-treesitter/nvim-treesitter', },
    config = true
  },
  ['nvim-treesitter/nvim-treesitter'] = {
    event = 'BufRead',
    branch = 'main',
    opts = {},
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
    end,
  },
  ['nvim-treesitter/nvim-treesitter-textobjects'] = {
    branch = 'main',
    dependencies = { 'nvim-treesitter' },
    event = 'BufRead',
    opts = {
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter-textobjects').setup(opts)
    end,
  },
  ['nvim-treesitter/nvim-treesitter-context'] = {
    event = 'BufRead',
    dependencies = { 'nvim-treesitter' },
    config = true,
  },
  ['HiPhish/rainbow-delimiters.nvim'] = {
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('rainbow-delimiters.setup').setup({
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      })
    end,
    submodules = false,
  },
}
