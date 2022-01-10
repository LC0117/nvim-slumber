vim.opt.list = true
vim.opt.listchars:append("eol:﬋")
vim.g.indent_blankline_filetype_exclude = {
    "startup",
    "TelescopePrompt"
}
require("indent_blankline").setup({
    show_end_of_line = false,
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {
        "startup",
        "NvimTree",
        "git",
        "markdown",
        "vimwiki",
        "TelescopePrompt",
        "help",
        "todolist",
        "log",
        "terminal",
        "litee",
        "txt",
        "flutterToolsOutline",
        "lspsaga",
        "nvim-lsp-installer",
        "",
    },
})
vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
