vim.opt.list = true
vim.opt.listchars:append("eol:﬋")
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
        "",
    },
})
vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
