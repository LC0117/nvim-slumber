require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '╰',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = nil,
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      default = '*',
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        added = '',
        deleted = '✖',
        modified = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
  renderers = {
    directory = {
      { 'indent' },
      { 'icon' },
      { 'current_filter' },
      {
        'name',
        use_git_status_colors = true,
      },
      {
        'symlink_target',
        highlight = 'NeoTreeSymbolicLinkTarget',
      },
      { 'clipboard' },
      { 'git_status' },
    },
    file = {
      { 'indent' },
      { 'icon' },
      {
        'name',
        use_git_status_colors = true,
      },
      {
        'symlink_target',
        highlight = 'NeoTreeSymbolicLinkTarget',
      },
      { 'bufnr' },
      { 'clipboard' },
      { 'git_status' },
    },
  },
  window = {
    position = 'left',
    width = 40,
    mappings = {
      ['<space>'] = 'toggle_node',
      ['<2-LeftMouse>'] = 'open',
      ['<cr>'] = 'open',
      ['S'] = 'open_split',
      ['s'] = 'open_vsplit',
      ['C'] = 'close_node',
      ['<bs>'] = 'navigate_up',
      ['.'] = 'set_root',
      ['H'] = 'toggle_hidden',
      ['R'] = 'refresh',
      ['/'] = 'fuzzy_finder',
      ['f'] = 'filter_on_submit',
      ['<c-x>'] = 'clear_filter',
      ['a'] = 'add',
      ['A'] = 'add_directory',
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy', -- takes text input for destination
      ['m'] = 'move', -- takes text input for destination
      ['q'] = 'close_window',
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
      },
      never_show = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    follow_current_file = true,
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
      },
    },
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['A'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },
  },
})
