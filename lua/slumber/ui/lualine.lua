local function apple()
  return [[]]
end
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { { 'branch' }, { 'diff' } },
    lualine_c = {},
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = '#BF616A',
        color_warn = '#EBCB8B',
        color_info = '#81A1AC',
        color_hint = '#88C0D0',
        symbols = { error = ' ', warn = ' ', info = ' ' },
      },
    },
    lualine_y = { 'filetype', 'encoding', 'fileformat' },
    lualine_z = { 'progress', { 'location', separator = { right = '' }, left_padding = 2 } },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
