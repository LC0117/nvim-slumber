local map = require('slumber.core.utils').map
local nmap = map.n
local vmap = map.v
local nimap = map.ni

-- telescope settings
-- find file
nmap('<leader>ff', [[:Telescope fd<CR>]])
-- find word
nmap('<leader>fw', [[:Telescope live_grep<CR>]])

-- lsp things
nmap('<leader>lf', vim.lsp.buf.format)
nmap('<leader>ca', vim.lsp.buf.code_action)
--vmap('<leader>ca', vim.lsp.buf.range_code_action, {buffer=true})
nmap('<leader>lr', vim.lsp.buf.rename)

nmap('<C-Q>', [[<Cmd>qall!<CR>]])
nmap('<C-S>', [[:wall<CR>]])
nmap('<leader>w', [[:w<CR>]])

nmap('K', vim.lsp.buf.hover)

-- NvimTree settings
-- tree focus
nmap('<leader>tf', [[:Neotree focus<CR>]])
-- tree toggle
nmap('<leader>tt', [[:Neotree toggle<CR>]])
-- tree gitstatus
nmap('<leader>tg', [[:Neotree git_status<CR>]])

-- gitsigns settings
nmap('<leader>gb', [[:Gitsigns blame_line<CR>]])
nmap('<leader>gt', [[:Gitsigns toggle_current_line_blame<CR>]])

-- bufferline mappings
nmap('b]', [[:BufferLineCycleNext<CR>]])
nmap('b[', [[:BufferLineCyclePrev<CR>]])
nmap('bp', [[:BufferLineTogglePin<CR>]])

-- utils
nmap(',d', [[:set background=dark<CR>]])
nmap(',l', [[:set background=light<CR>]])
