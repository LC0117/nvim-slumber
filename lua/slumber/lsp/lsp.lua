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
        use_lspsaga = true,
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
    "cssls",
    "clojure_lsp",
    "hls",
    "cmake",
    "zeta_note",
    "vimls",
    "bashls",
    "html",
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

-- this is just a example for setting LSP servers like haxe, not useful
nvim_lsp.haxe_language_server.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = { "node", "~/.local/opt/haxe/server.js" },
})

-- avoid several servers running for filetypes c and cpp
nvim_lsp.sourcekit.setup({
    filetypes = { "swift" },
})
