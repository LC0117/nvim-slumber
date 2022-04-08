local map = vim.api.nvim_set_keymap
local nsil = { noremap = true, silent = true }

local function nmap(key, cmd)
  map('n', key, cmd, nsil)
end

local function vmap(key, cmd)
  map('v', key, cmd, nsil)
end
-- telescope settings
nmap('<leader>f', [[:Telescope fd<CR>]])
nmap('<leader>gr', [[:Telescope live_grep<CR>]])

-- lsp formatting
nmap('<leader><leader>', [[:lua vim.lsp.buf.formatting_sync()<CR>]])

nmap('<C-Q>', [[<Cmd>qall!<CR>]])
nmap('<C-S>', [[:wall<CR>]])
nmap(',w', [[:w<CR>]])

vmap('<leader>r', [[<Cmd>Lspsaga rename<CR>]])
nmap('K', [[:lua vim.lsp.buf.hover()<CR>]])
nmap(
  '<leader>ca',
  [[:lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({layout_config={height=15}}))<CR>]]
)
vmap(
  '<leader>ca',
  [[:lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor({layout_config={height=15}}))<CR>]]
)

-- NvimTree settings
nmap('<C-a>', [[:Neotree focus<CR>]])
nmap('<C-n>', [[:Neotree<CR>]])
nmap('<C-G>', [[:Neotree git_status<CR>]])

-- gitsigns settings
nmap(',gb', [[:Gitsigns blame_line<CR>]])
nmap(',gt', [[:Gitsigns toggle_current_line_blame<CR>]])
