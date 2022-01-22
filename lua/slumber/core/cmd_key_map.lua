vim.cmd([[let mapleader = ","]])

local sil = { silent = true }

-- telescope settings
vim.api.nvim_set_keymap("n", "<c-f>", ":Telescope fd<CR>", sil)

-- material toggle style
vim.api.nvim_set_keymap(
    "n",
    "<leader>mm",
    [[<Cmd>lua require('material.functions').toggle_style()<CR>]],
    { noremap = true, silent = true }
)

