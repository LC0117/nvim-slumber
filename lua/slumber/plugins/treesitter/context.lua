require('treesitter-context').setup({
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
    rust = {
      'impl_item',
    },
  },
  exact_patterns = {},
})
