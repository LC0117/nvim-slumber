local M = {}

function M.fidget()
  require('fidget').setup({
    text = {
      spinner = 'moon',
    },
  })
end

function M.notify()
  require('notify').setup({
    stages = 'fade_in_slide_out',
    render = 'default',
    timeout = 2566,
    max_width = 60,
    icons = {
      ERROR = '',
      WARN = '',
      INFO = '',
      DEBUG = '',
      TRACE = '✎',
    },
  })
  vim.notify = require('notify')
end

function M.kanagawa()
  require('kanagawa').setup({
    undercurl = true,
    commentStyle = 'italic',
    functionStyle = 'italic',
    keywordStyle = 'italic,bold',
    specialException = true,
    transparent = false,
  })
end

function M.onenord()
  require('onenord').setup({
    borders = true,
    fade_nc = true,
    styles = {
      comments = 'italic',
      keywords = 'italic,bold',
      functions = 'italic',
      diagnostics = 'undercurl',
    },
  })
end

function M.treesitter()
  require('slumber.editor.treesitter')
end

function M.neoscroll()
  require('neoscroll').setup({
    hide_cursor = true,
    stop_eof = true,
  })
end

function M.commentstring()
  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

function M.context()
  require('treesitter-context').setup({
    enable = true,
    throttle = true,
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
  })
end

function M.autotag()
  require('nvim-treesitter.configs').setup({
    autotag = {
      enable = true,
      filetypes = {
        'html',
        'xml',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'svelte',
      },
    },
  })
end

function M.textobjects()
  require('nvim-treesitter.configs').setup({
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>sn'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>sN'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ['<leader>df'] = '@function.outer',
          ['<leader>dF'] = '@class.outer',
        },
      },
    },
  })
end

function M.rainbow()
  require('nvim-treesitter.configs').setup({
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },
  })
end

function M.startup()
  require('slumber.editor.startup')
end

function M.matchup()
  vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
  require('nvim-treesitter.configs').setup({
    matchup = {
      enable = true,
    },
  })
end

return M
