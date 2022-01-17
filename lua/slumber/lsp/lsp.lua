local nvim_lsp = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- enable servers' capabilities
capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown",
    "plaintext",
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = { 1 },
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

local function custom_attach()
    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = { border = "double" },
        transparency = 20,
    })
end

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { "vim", "packer_plugins" } },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                telemetry = { enable = false },
            },
        }
    elseif server.name == "ltex" then
        opts.filetypes = { "bib", "tex" }
    end
    opts.capabilities = capabilities
    opts.flags = { debounce_text_changes = 500 }
    opts.on_attach = custom_attach

    server:setup(opts)
end)

-- These are servers easy to setup
local clients = {
    "clangd",
    "clojure_lsp",
    "hls",
    "cmake",
    "vimls",
    "bashls",
    "dockerls",
    "pylsp",
    "gopls",
    "taplo",
    "zls",
    "volar",
    "yamlls",
    "solargraph",
    "julials",
    "jsonls",
    "graphql",
    "golangci_lint_ls",
    "spectral",
    "r_language_server",
    "fortls",
    "html",
    "cssls",
    "svls",
    "typeprof",
}

for _, lsp in ipairs(clients) do
    nvim_lsp[lsp].setup({
        on_attach = custom_attach,
        capabilities = capabilities,
    })
end

-- enable forword search for Skim.app
nvim_lsp.texlab.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    filetypes = { "tex", "plaintex", "latex", "bib", "bibtex" },
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-pvc", "-xelatex" },
                onSave = true,
                forwardSearchAfter = true,
                isContinuous = false,
            },
            forwardSearch = {
                executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                args = { "%l", "%p", "%f" },
            },
        },
    },
})

nvim_lsp.vls.setup({
    cmd = { "vlangls" },
    on_attach = custom_attach,
    capabilities = capabilities,
})

-- this is just a example for setting LSP servers like haxe, not useful
nvim_lsp.haxe_language_server.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = { "node", "~/.local/opt/haxe/server.js" },
})

-- avoid several servers running for filetypes c and cpp
nvim_lsp.sourcekit.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    filetypes = { "swift" },
})

-- tsserver setup
nvim_lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
        custom_attach()

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end,
})
