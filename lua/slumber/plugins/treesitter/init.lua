require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {
      'org',
    },
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
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = t,
    extended_mode = true,
    max_file_lines = 3000,
  },
  matchup = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = ',r',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = '<leader>gd',
        list_definitions = '<leader>gl',
        list_definitions_toc = '<leader>gt',
        goto_next_usage = '<leader>n',
        goto_previous_usage = '<leader>N',
      },
    },
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
})
