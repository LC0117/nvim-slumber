vim.cmd([[let mapleader = ","]])
local map = vim.api.nvim_set_keymap
local sil = { silent = true }
local nsil = { noremap = true, silent = true }
-- telescope settings
map("n", "<c-f>", ":Telescope fd<CR>", sil)
map("n", "<c-g>", "<Cmd>Telescope live_grep<CR>", sil)

-- material toggle style
map("n", "<leader>mm", [[<Cmd>lua require('material.functions').toggle_style()<CR>]], nsil)

-- lsp formatting
map("n", "<leader><leader>", [[<Cmd>lua vim.lsp.buf.formatting_sync()<CR>]], nsil)
map("n", "<leader>l", [[:lua require("vscode").change_style("light")<CR>]], nsil)
map("n", "<leader>m", [[:lua require("vscode").change_style("dark")<CR>]], nsil)

map("n", "<c-q>", "<Cmd>qall<CR>", nsil)
--map("n", "<c-r>", "<cmd>lua require('cosmic-ui').rename()<cr>", nsil)
--map("n", "<leader>ca", "<cmd>lua require('cosmic-ui').code_actions()<cr>", nsil)
--map("v", "<leader>ca", "<cmd>lua require('cosmic-ui').range_code_actions()<cr>", nsil)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", nsil)
map("n", "<C-R>", "<cmd>Lspsaga rename<CR>", nsil)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", nsil)
map("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", nsil)
