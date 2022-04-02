local parsers_config = require('nvim-treesitter.parsers').get_parser_configs()
parsers_config.matlab = {
  install_info = {
    url = 'https://github.com/mstanciu552/tree-sitter-matlab',
    branch = 'main',
    files = { 'src/parser.c' },
  },
  filetype = 'matlab',
}
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
})
vim.cmd('set foldmethod=manual')
