vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
local parsers_config = require("nvim-treesitter.parsers").get_parser_configs()
parsers_config.matlab = {
    install_info = {
        url = "https://github.com/mstanciu552/tree-sitter-matlab",
        branch = "main",
        files = { "src/parser.c" },
    },
    filetype = "matlab",
}
--require("nvim-treesitter.install").prefer_git = true
-- require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
    --ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = {
            "org",
        },
        additional_vim_regex_highlighting = false,
    },
})
