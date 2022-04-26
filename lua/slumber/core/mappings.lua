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
nmap('<leader>f', [[:Telescope fd<CR>]])
nmap('<leader>gr', [[:Telescope live_grep<CR>]])
nmap('<leader>s', require('slumber.plugins.finder.utils').buf_find)

-- lsp things
nmap('<leader>fm', vim.lsp.buf.formatting_sync)
nmap('<leader>ca', vim.lsp.buf.code_action)
vmap('<leader>ca', vim.lsp.buf.range_code_action)

nmap('<C-Q>', [[<Cmd>qall!<CR>]])
nmap('<C-S>', [[:wall<CR>]])
nmap('<leader>w', [[:w<CR>]])

nmap('K', vim.lsp.buf.hover)

-- NvimTree settings
nmap('<leader>x', [[:Neotree focus<CR>]])
nmap('<leader>o', [[:Neotree<CR>]])
nmap('<leader>gs', [[:Neotree git_status<CR>]])

-- gitsigns settings
nmap(',gb', [[:Gitsigns blame_line<CR>]])
nmap(',gt', [[:Gitsigns toggle_current_line_blame<CR>]])

-- bufferline mappings
nmap('b]', [[:BufferLineCycleNext<CR>]])
nmap('b[', [[:BufferLineCyclePrev<CR>]])
nmap('bp', [[:BufferLineTogglePin<CR>]])

-- nvim-dap mappings
nimap('<F2>', require('dap').toggle_breakpoint)
nimap('<F5>', require('dap').continue)
