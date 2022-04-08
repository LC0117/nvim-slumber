require('gitsigns').setup({
  signs = {
    delete = { hl = 'GitSignsDelete', text = '' },
    topdelete = { hl = 'GitSignsDelete', text = '' },
    changedelete = { hl = 'GitSignsChange', text = 'ﯞ' },
  },
  linehl = false,
  numhl = true,
  watch_gitdir = { interval = 1000, follow_files = true },
  current_line_blame = false,
  current_line_blame_opts = { delay = 500, virt_text_pos = 'right_align' },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  word_diff = false,
  diff_opts = { internal = true },
  preview_config = {
    border = 'rounded',
  },
})
