vim.cmd([[autocmd BufEnter,BufReadPre,BufRead,BufNewFile *.v setlocal filetype=vlang]])
require('slumber.core.opts')
require('slumber.core.packers')
require('slumber.core.themes_config')
require('slumber.core.mappings')
