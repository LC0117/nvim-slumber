local M = {}

function M.fidget()
  require('fidget').setup({
    text = {
      spinner = 'moon',
    },
  })
end

function M.refactor()
  require('refactoring').setup({})
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

function M.textobjects()
  require('slumber.editor.textobjects')
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
  require('nvim-treesitter.configs').setup({
    matchup = {
      enable = true,
    },
  })
  vim.g.matchup_matchparen_offscreen = {
    method = 'popup',
  }
end

return M
