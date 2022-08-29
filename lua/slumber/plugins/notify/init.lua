require('notify').setup({
  stages = 'fade_in_slide_out',
  render = 'default',
  timeout = 4000,
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
