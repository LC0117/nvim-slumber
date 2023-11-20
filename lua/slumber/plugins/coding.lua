return {
  ['L3MON4D3/LuaSnip'] = {
    lazy = false,
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    build = 'make install_jsregexp',
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
  },
  ['hrsh7th/nvim-cmp'] = {
    event = 'InsertEnter',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'nvim-lspconfig',
      'nvim-treesitter',
    },
    config = function()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline', max_item_count = 15 },
        },
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer', max_item_count = 10 },
        },
      })
      cmp.setup({
        enabled = function()
          local context = require('cmp.config.context')
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          elseif vim.api.nvim_buf_get_option(0, 'filetype') == 'TelescopePrompt' then
            return false
          else
            return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
          end
        end,
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = true,
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' },
        },
        window = {
          documentation = {
            border = 'rounded',
          },
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local lspkind_icons = vim.lsp.protocol.CompletionItemKind
            vim_item.kind = lspkind_icons[vim_item.kind]
            vim_item.menu = ({
              luasnip = '[Snip]',
              nvim_lsp = '[LSP]',
              path = '[PATH]',
              neorg = '[NORG]',
              cmdline = '[cmd]',
              crates = '[crates.io]',
              buffer = '[BUF]',
            })[entry.source.name]
            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
            return vim_item
          end,
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-c>'] = cmp.mapping.close(),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
          ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        },
        sources = {
          { name = 'luasnip',     max_item_count = 5 },
          { name = 'nvim_lsp',    max_item_count = 15 },
          { name = 'cmp_tabnine', keyword_length = 2 },
          { name = 'path',        max_item_count = 10 },
          {
            name = 'buffer',
            max_item_count = 5,
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },
  ['windwp/nvim-autopairs'] = {
    dependencies = {
      'nvim-cmp',
    },
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
  },
  ['tpope/vim-sleuth'] = { lazy = false },
  ['JoosepAlviste/nvim-ts-context-commentstring'] = { lazy = false },
  ['nvim-treesitter/nvim-treesitter'] = {
    event = 'BufRead',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '[[',
          node_incremental = ']n',
          scope_incremental = ']]',
          node_decremental = '[n',
        },
      },
      autotag = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 3000,
      },
      matchup = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['f]'] = '@function.outer',
            ['f['] = '@function.inner',
            ['c]'] = '@class.outer',
            ['c['] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['[]'] = '@parameter.inner',
          },
          swap_previous = {
            [']['] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
          },
        },
        lsp_interop = {
          enable = true,
          border = 'rounded',
          peek_definition_code = {
            ['<leader>df'] = '@function.outer',
            ['<leader>cf'] = '@class.outer',
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  ['nvim-treesitter/nvim-treesitter-context'] = {
    event = 'BufRead',
    dependencies = { 'nvim-treesitter' },
    config = true,
  },
}
