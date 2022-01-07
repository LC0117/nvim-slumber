local M = {}

local function to_bool(x)
    if x == 1 then
        return false
    else
        return true
    end
end

function M.cupcin()
    require("slumber.ui.cupcin")
end

function M.tokyo()
    vim.g.tokyonight_transparent = false
    vim.g.tokyonight_transparent_sidebar = false
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    if vim.fn.has("gui_vimr") == 1 or vim.fn.has("neovide") == 1 then
        vim.g.tokyonight_transparent = false
        vim.g.tokyonight_transparent_sidebar = false
    end
    vim.cmd("colorscheme tokyonight")
end

function M.blankline()
    require("slumber.ui.indent_blankline")
end

function M.lualine()
    require("slumber.ui.lualine")
end

function M.bufferline()
    require("slumber.ui.bufferline")
end

function M.gitsigns()
    require("slumber.ui.gitsigns")
end

function M.tree()
    require("slumber.ui.nvim_tree")
end

return M
