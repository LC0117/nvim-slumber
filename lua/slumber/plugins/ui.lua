return {
  ['glepnir/dashboard-nvim'] = {
    event = 'VimEnter',
    priority = 100,
    opts = {
      theme = 'doom',
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = {
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
          ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
          ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
          ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
          ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
          ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
          ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
        },
        center = {
          {
            icon = ' ',
            desc = 'Find Files          ',
            action = [[Telescope find_files]],
            key = 'SPC f f',
          },
          {
            icon = ' ',
            desc = 'Find Word           ',
            action = [[Telescope live_grep]],
            key = 'SPC l g',
          },
          {
            icon = ' ',
            desc = 'File Browser        ',
            action = [[Telescope file_browser]],
            key = 'SPC f b',
          },
          {
            icon = ' ',
            desc = 'Recent Files        ',
            action = [[DashboardFindHistory]],
            key = 'SPC f h',
          },
        },
        footer = {
          'I don\'t like breaking change!',
        },
      },
    },
  },
  ['lewis6991/gitsigns.nvim'] = {
    event = { 'BufRead', 'BufNewFile' },
    opts = {
      signs = {
        delete = { text = ' ' },
        topdelete = { text = '󰑃 ' },
        changedelete = { text = '󰑃 ' },
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
    },
  },
  ['nvim-neo-tree/neo-tree.nvim'] = {
    branch = 'v3.x',
    cmd = 'Neotree',
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require('neo-tree')
        end
      end
    end,
    opts = {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      source_selector = {
        winbar = 'true',
      },
      default_component_configs = {
        indent = {
          indent_marker = '│',
          last_indent_marker = '╰',
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            '.DS_Store',
            'thumbs.db',
            '__pycache__',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
            '.git',
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
      },
    },
  },
  ['lukas-reineke/indent-blankline.nvim'] = {
    main = 'ibl',
    event = 'BufReadPost',
    opts = {
      --show_current_context = true,
      --show_current_context_start = true,
      --show_first_indent_level = false,
      indent = {
        highlight = {
          'RainbowRed',
          'RainbowYellow',
          'RainbowBlue',
          'RainbowOrange',
          'RainbowGreen',
          'RainbowViolet',
          'RainbowCyan',
        },
        char = '▏'
      },
    },
  },
  ['akinsho/bufferline.nvim'] = {
    event = 'BufRead',
    config = function()
      require('bufferline').setup({
        options = {
          number = 'none',
          modified_icon = '✥ ',
          buffer_close_icon = '󰖭 ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',
          max_name_length = 14,
          max_prefix_length = 13,
          tab_size = 20,
          show_buffer_close_icons = true,
          show_buffer_icons = true,
          show_tab_indicators = true,
          indicator = {
            style = 'underline',
          },
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
              require('bufferline.groups').builtin.pinned:with({ icon = '' }),
              require('bufferline.groups').builtin.ungrouped,
              {
                name = 'Tests',
                icon = ' ',
                matcher = function(buf)
                  return buf.name:match('%_test')
                    or buf.name:match('%Test')
                    or buf.name:match('%_spec')
                    or buf.name:match('%Spec')
                end,
              },
              {
                name = 'Docs',
                icon = ' ',
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
    end,
  },
  ['folke/noice.nvim'] = {
    event = 'VimEnter',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = 'rounded',
      },
    },
  },
  ['stevearc/dressing.nvim'] = {
    init = function()
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end,
  },
  ['nvim-lualine/lualine.nvim'] = {
    event = 'BufRead',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
          'tabs',
        },
        lualine_b = { { 'branch' }, { 'diff' } },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
              error = 'DiagnosticError',
              warn = 'DiagnosticWarn',
              info = 'DiagnosticInfo',
              hint = 'DiagnosticHint',
            },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
          },
        },
        lualine_y = { 'filetype', 'encoding', 'fileformat' },
        lualine_z = { 'progress', { 'location', separator = { right = '' }, left_padding = 2 } },
      },
    },
  },
  ['rcarriga/nvim-notify'] = {
    event = 'VimEnter',
    init = function()
      vim.notify = require('notify')
    end,
    opts = {
      stages = 'fade_in_slide_out',
      render = 'default',
      timeout = 4000,
      max_width = 60,
      icons = {
        ERROR = ' ',
        WARN = ' ',
        INFO = ' ',
        DEBUG = ' ',
        TRACE = '✎',
      },
    },
  },
}
