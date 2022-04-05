require('dressing').setup({
  select = {
    enabled = true,
    telescope = require('telescope.themes').get_cursor({
      layout_config = {
        height = 15,
      },
    }),
  },
})
