local groups = require('bufferline.groups')
require('bufferline').setup({
  options = {
    number = 'none',
    modified_icon = '✥',
    buffer_close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_buffer_close_icons = true,
    show_buffer_icons = true,
    show_tab_indicators = true,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = true,
    separator_style = 'thin',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'center',
      },
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        groups.builtin.pinned:with({ icon = '' }),
        groups.builtin.ungrouped,
        {
          name = 'Tests',
          icon = ' ',
          matcher = function(buf)
            return buf.name:match('%_test')
              or buf.name:match('%_Test')
              or buf.name:match('%_Tests')
              or buf.name:match('%_spec')
          end,
        },
        {
          name = 'Docs',
          icon = '',
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.tex')
          end,
        },
        {
          name = 'Dotfiles',
          matcher = function(buf)
            return buf.name:sub(1, 1) == '.'
          end,
        },
      },
    },
  },
})
