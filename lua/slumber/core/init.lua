vim.cmd([[autocmd BufEnter,BufReadPre,BufRead,BufNewFile *.v setlocal filetype=vlang]])
vim.cmd([[set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h12]])
require('slumber.core.opts')
require('slumber.core.plugins')
require('slumber.core.cmd_key_map')
