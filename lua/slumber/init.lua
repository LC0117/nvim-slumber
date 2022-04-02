vim.g.neovide_transparency = 0.9
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_cursor_vfx_mode = 'torpedo'
vim.cmd([[
    function! s:write_server_name() abort
        let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
        call writefile([v:servername], nvim_server_file)
    endfunction

    autocmd FileType tex,plaintex,latex call s:write_server_name()
]])
require('impatient')
require('slumber.core')
