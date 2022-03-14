vim.cmd([[let mapleader = ","]])
local map = vim.api.nvim_set_keymap
local nsil = { noremap = true, silent = true }

local function nmap(key, cmd)
  map('n', key, cmd, nsil)
end

local function vmap(key, cmd)
  map('v', key, cmd, nsil)
end
-- telescope settings
nmap('<C-F>', [[:Telescope fd<CR>]])
nmap('<C-G>', [[:Telescope live_grep<CR>]])

-- lsp formatting
nmap('<leader><leader>', [[:lua vim.lsp.buf.formatting_sync()<CR>]])
nmap('<leader>l', [[:lua require("vscode").change_style("light")<CR>]])
nmap('<leader>m', [[:lua require("vscode").change_style("dark")<CR>]])

nmap('<C-Q>', [[<Cmd>qall<CR>]])
nmap('<C-S>', [[:wall<CR>]])

vmap('<c-r>', [[<Cmd>Lspsaga rename<CR>]])
nmap('K', [[:Lspsaga hover_doc<CR>]])
nmap('<leader>ca', [[:Lspsaga code_action<CR>]])
vmap('<leader>ca', [[:Lspsaga range_code_action<CR>]])

-- NvimTree settings
nmap('<C-x>', [[:NvimTreeFocus<CR>]])
nmap('<C-n>', [[:NvimTreeToggle<CR>]])
