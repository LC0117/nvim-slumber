local function nmap(key, fun)
  vim.keymap.set('n', key, fun)
end

local function vmap(key, fun)
  vim.keymap.set('v', key, fun)
end

local function nimap(key, fun)
  vim.keymap.set({ 'n', 'i' }, key, fun)
end

-- telescope settings
-- find file
nmap('<leader>ff', [[:Telescope fd<CR>]])
-- find word
nmap('<leader>fw', [[:Telescope live_grep<CR>]])
-- find current buffer
nmap('<leader>fb', require('slumber.plugins.finder.utils').buf_find)

-- lsp things
nmap('<leader>lf', vim.lsp.buf.formatting_sync)
nmap('<leader>ca', vim.lsp.buf.code_action)
vmap('<leader>ca', vim.lsp.buf.range_code_action)
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

-- nvim-dap mappings
nimap('<F2>', require('dap').toggle_breakpoint)
nimap('<F5>', require('dap').continue)
