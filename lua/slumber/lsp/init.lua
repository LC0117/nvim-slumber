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
    local pairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", pairs.on_confirm_done({ map_char = { tex = ""} }))
    pairs.lisp[#pairs.lisp+1] = "racket"
    require("nvim-autopairs").setup({ map_cr = true })
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

