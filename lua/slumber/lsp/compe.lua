local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")
cmp.setup.cmdline(":", {
    sources = {
        { name = "cmdline", max_item_count = 15 },
    },
})
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer", max_item_count = 15 },
    },
})
cmp.setup({
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        format = function(entry, vim_item)
            local lspkind_icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "ﬦ",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            }
            vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                cmp_tabnine = "[TN]", -- tabnine is lazy-loaded
                buffer = "[BUFFER]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[nLua]",
                path = "[PATH]",
                tmux = "[TMUX]",
                luasnip = "[Snip]",
                spell = "[SPELL]",
                emoji = "[emoji]",
                cmp_git = "[git]",
                crates = "[crates]",
                neorg = "[NORG]",
                cmdline = "[cmd]",
            })[entry.source.name]

            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)

            return vim_item
        end,
    },
    -- You can set mappings if you want
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-b>"] = function(fallback)
            if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end,
        ["<C-a>"] = function(fallback)
            if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            else
                fallback()
            end
        end,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- You should specify your *installed* sources.
    sources = {
        { name = "luasnip" },
        { name = "nvim_lua", max_item_count = 15 },
        { name = "nvim_lsp", max_item_count = 15 },
        { name = "path" },
        { name = "spell" },
        { name = "tmux" },
        { name = "neorg" },
        { name = "buffer", keyword_length = 3 },
        { name = "cmp_tabnine" },
        { name = "latex_symbols" },
        { name = "emoji", max_item_count = 15 },
        { name = "cmp_git" },
        { name = "crates", max_item_count = 15 },
        { name = "cmdline" },
    },
})
