local M = {}
local snip_path = vim.fn.stdpath("data") .. "site/pack/packer/opt/friendly-snippets"

function M.lspconfig()
    require("slumber.lsp.lsp")
end

function M.luasnip()
    require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip/loaders/from_vscode").load({
        --path = snip_path
    })
end

function M.autopairs()
    require("nvim-autopairs").setup({})

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
end

function M.cmp_git()
    require("cmp_git").setup()
end

function M.compe()
    require("slumber.lsp.compe")
end

function M.lightbulb()
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
end

function M.tabnine()
    local tabnine = require("cmp_tabnine.config")
    tabnine:setup({ max_line = 1000, max_num_results = 20, sort = true })
end

function M.null_ls()
    require("slumber.lsp.null_ls")
end

return M
