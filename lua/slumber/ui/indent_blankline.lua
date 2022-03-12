vim.opt.list = true
require('indent_blankline').setup({
  show_end_of_line = false,
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    'startify',
    'dashboard',
    'dotooagenda',
    'log',
    'fugitive',
    'gitcommit',
    'packer',
    'vimwiki',
    'markdown',
    'json',
    'txt',
    'vista',
    'help',
    'todoist',
    'NvimTree',
    'peekaboo',
    'git',
    'TelescopePrompt',
    'undotree',
    'flutterToolsOutline',
    'startup',
    '', -- for all buffers without a file type
  },
  buftype_exclude = { 'terminal', 'nofile' },
  context_patterns = {
    'class',
    'function',
    'method',
    'block',
    'list_literal',
    'selector',
    '^if',
    '^table',
    'if_statement',
    'while',
    'for',
    'type',
    'var',
    'import',
  },
})
vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
