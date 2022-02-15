local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require("cmp")
local luasnip = require("luasnip")
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
                luasnip = "[Snip]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[nLua]",
                path = "[PATH]",
                tmux = "[TMUX]",
                emoji = "[emoji]",
                cmp_git = "[git]",
                crates = "[crates]",
                neorg = "[NORG]",
                cmdline = "[cmd]",
                omni = (vim.inspect(vim_item.menu):gsub("%\"", "")),
            })[entry.source.name]

            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)

            return vim_item
        end,
    },

    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Up>"] = cmp.mapping.scroll_docs(-4),
        ["<Down>"] = cmp.mapping.scroll_docs(4),
        ["<C-c>"] = cmp.mapping.close(),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    sources = {
        { name = "luasnip", max_item_count = 5 },
        { name = "nvim_lua", max_item_count = 15 },
        { name = "nvim_lsp", max_item_count = 15 },
        { name = "cmp_tabnine", keyword_length = 2 },
        { name = "omni", max_item_count = 15 },
        { name = "path" },
        { name = "tmux", max_item_count = 10 },
        { name = "neorg" },
        { name = "buffer", keyword_length = 3 },
        { name = "emoji", max_item_count = 15 },
        { name = "cmp_git", max_item_count = 15 },
        { name = "crates", max_item_count = 15 },
        { name = "cmdline" },
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})
