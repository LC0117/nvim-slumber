vim.g.nvim_tree_icons = {
  git = {
    ignored = '',
  },
}
vim.g.nvim_tree_indent_markers = 1

require("nvim-tree").setup({
    git = {
        enable = true,
        ignore = false
    },
    update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  }
})
