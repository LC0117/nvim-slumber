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
