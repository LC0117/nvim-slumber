local M = {}

function M.sniprun()
    require("sniprun").setup({
        selected_interpreters = {},
        repl_enable = {},
        repl_disable = {},
        interpreter_options = {},
        display = {
            "Classic",
            "VirtualTextOk",
            "VirtualTextErr",
            "LongTempFloatingWindow",
        },
        inline_messages = 0,
        borders = "shadow",
    })
end

function M.glow()
    vim.g.glow_border = "rounded"
end

function M.octo()
    require("slumber.tools.octo")
end

function M.telescope()
    require("slumber.tools.telescope")
end

function M.todo()
    require("todo-comments").setup({})
end

function M.trouble()
    require("trouble").setup({})
end

function M.comment()
    require("Comment").setup({
        pre_hook = function(ctx)
            local U = require("Comment.utils")

            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring.internal").calculate_commentstring({
                key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                location = location,
            })
        end,
    })
end

function M.hlslens()
    require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "always",
        override_lens = function(render, plist, nearest, idx, r_idx)
            local sfw = vim.v.searchforward == 1
            local indicator, text, chunks
            local abs_r_idx = math.abs(r_idx)
            if abs_r_idx > 1 then
                indicator = ("%d%s"):format(abs_r_idx, sfw ~= (r_idx > 1) and "▲" or "▼")
            elseif abs_r_idx == 1 then
                indicator = sfw ~= (r_idx == 1) and "▲" or "▼"
            else
                indicator = ""
            end

            local lnum, col = unpack(plist[idx])
            if nearest then
                local cnt = #plist
                if indicator ~= "" then
                    text = ("[%s %d/%d]"):format(indicator, idx, cnt)
                else
                    text = ("[%d/%d]"):format(idx, cnt)
                end
                chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
            else
                text = ("[%s %d]"):format(indicator, idx)
                chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
            end
            render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
        end,
    })
end

function M.toggleterm()
    require("toggleterm").setup({
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.40
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
    })
end

function M.neorg()
    require("slumber.tools.org")
end

return M
