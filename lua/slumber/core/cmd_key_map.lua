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

map("n", "<c-q>", "<Cmd>qall<CR>", nsil)
map("n", "<c-r>", "<cmd>lua require('cosmic-ui').rename()<cr>", nsil)
map("n", "<leader>ca", "<cmd>lua require('cosmic-ui').code_actions()<cr>", nsil)
map("v", "<leader>ca", "<cmd>lua require('cosmic-ui').range_code_actions()<cr>", nsil)
