return {
  ['toppair/peek.nvim'] = {
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    opts = {
      theme = vim.env.TERM_THEME,
    },
  },
  ['nvim-telescope/telescope.nvim'] = {
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      local load_extension = require('telescope').load_extension
      require('telescope').setup({
        defaults = {
          prompt_prefix = '🔭 ',
          selection_caret = ' ',
          layout_strategy = 'horizontal',
          entry_prefix = '  ',
          initial_mode = 'insert',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              results_width = 0.8,
              prompt_position = 'top',
              preview_width = 0.55,
            },
          },
          dynamic_preview_title = true,
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
          },
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = {},
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'relative' },
          winblend = 0,
          border = {},
          color_devicons = true,
          use_less = true,
          set_env = { ['COLORTERM'] = 'truecolor' },
        },
        pickers = {
          find_files = {
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            case_mode = 'smart_case',
          },
        },
      })
      load_extension('fzf')
      load_extension('file_browser')
      load_extension('notify')
    end,
  },
  ['mfussenegger/nvim-dap'] = {
    event = 'BufWinEnter',
    config = function()
      require('slumber.dap')
    end,
  },
  ['rcarriga/nvim-dap-ui'] = {
    dependencies = { 'nvim-dap' },
    config = function()
      require('slumber.dap.ui')
    end,
  },
  ['theHamsta/nvim-dap-virtual-text'] = {
    dependencies = { 'nvim-dap' },
    config = function()
      require('slumber.dap.virtual')
    end,
  },
}
