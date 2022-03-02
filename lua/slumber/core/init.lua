vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h12
if exists("g:neoray")
    NeoraySet CursorAnimTime 0.08
    NeoraySet Transparency   0.95
    NeoraySet TargetTPS      120
    NeoraySet ContextMenuOn  TRUE
    NeoraySet BoxDrawingOn   TRUE
    NeoraySet WindowSize     100x40
    NeoraySet WindowState    centered
    NeoraySet KeyFullscreen  <M-C-CR>
    NeoraySet KeyZoomIn      <C-ScrollWheelUp>
    NeoraySet KeyZoomOut     <C-ScrollWheelDown>
endif
autocmd BufEnter,BufReadPre,BufRead,BufNewFile *.v setlocal filetype=vlang
]])
require("slumber.core.opts")
require("slumber.core.plugins")
require("impatient")
require("slumber.core.cmd_key_map")
---@diagnostic disable-next-line: unused-function
local function some(no)
    print(no)
end

