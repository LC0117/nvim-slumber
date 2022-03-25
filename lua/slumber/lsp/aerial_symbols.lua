require('aerial').setup({
  backends = { 'lsp', 'treesitter', 'markdown' },
  close_behavior = 'auto',
  highlight_on_hover = true,
  highlight_on_jump = 300,
  max_width = { 40, 0.2 },
  manage_folds = true,
  min_width = 20,
  show_guides = true,
  filter_kind = false,
  guides = {
    mid_item = '├─',
    last_item = '╰─',
    nested_top = '│ ',
    whitespace = '  ',
  },
})
