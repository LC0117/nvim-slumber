local home = os.getenv('HOME')

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
    dash = {
      dash_app_path = '/Applications/Dash.app',
      search_engine = 'duckduckgo',
      debounce = 10,
      file_type_kewords = {
        dashboard = false,
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        fzf = false,
        javascript = { 'javascript', 'nodejs' },
        typescript = { 'typescript', 'javascript', 'nodejs' },
        typescriptreact = { 'typescript', 'javascript', 'react' },
        javascriptreact = { 'javascript', 'react' },
        java = { 'java17', 'java' },
      },
    },
  },
})

require('telescope').load_extension('notify')
