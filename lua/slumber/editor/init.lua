local M = {}

function M.refractor()
    require("nvim-treesitter.configs").setup({
        refractor = {
            highlight_definitions = { enable = true },
            highlight_current_scope = { enable = true },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "rn",
                },
            },
            navigator = {
                enable = true,
                keymaps = {
                    goto_definition = "gnd",
                    list_definitions = "gnD",
                    list_definitions_toc = "gO",
                    goto_next_usage = "<a-*>",
                    goto_previous_usage = "<a-#>",
                },
            },
        },
    })
end

function M.paper()
    require("newpaper").setup({
        style = "light",
        contrast_sidebar = true,
        keywords = "italic,bold",
        italic_strings = false,
        italic_comments = true,
        italic_functions = true,
        italic_variables = true,
        hide_eob = true,
    })
end

function M.treesitter()
    require("slumber.editor.treesitter")
end

function M.commentstring()
    require("nvim-treesitter.configs").setup({
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

function M.context()
    require("treesitter-context").setup({
        enable = true,
        throttle = true,
        patterns = {
            default = {
                "class",
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },
            rust = {
                "impl_item",
            },
        },
    })
end

function M.autotag()
    require("nvim-treesitter.configs").setup({
        autotag = {
            enable = true,
            filetypes = {
                "html",
                "xml",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
            },
        },
    })
end

function M.textobjects()
    require("nvim-treesitter.configs").setup({
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sn"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>sN"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
        },
    })
end

function M.rainbow()
    require("nvim-treesitter.configs").setup({
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 1000,
        },
    })
end

function M.startup()
    require("slumber.editor.startup")
end

function M.gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ",
            ["function-name"] = " ",
            ["method-name"] = " ",
            ["tag-name"] = "炙",
            ["container-name"] = "⛶ ",
        },
        separator = "  ",
        depth = 0,
        depth_limit_indicator = "..",
    })
end

function M.matchup()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
    require("nvim-treesitter.configs").setup({
        matchup = {
            enable = true,
        },
    })
end

return M
