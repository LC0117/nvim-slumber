local lsp_installer = require("nvim-lsp-installer")
local nlsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})

local function custom_attach()
    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        hint_enable = true,
        hi_parameter = "Search",
        hint_prefix = ": ",
        handler_opts = { border = "rounded" },
        transparency = 30,
    })
    require("virtualtypes").on_attach()
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.capabilities = capabilities
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
    "gopls",
    "taplo",
    "zls",
    "volar",
    "yamlls",
    "solargraph",
    "julials",
    "jsonls",
    "graphql",
    "spectral",
    "r_language_server",
    "fortls",
    "html",
    "cssls",
    "svls",
    "typeprof",
    "pyright",
    "ocamllsp",
    "fsautocomplete",
    "rust_analyzer"
}

for _, cli in ipairs(clients) do
    nlsp[cli].setup({
        on_attach = custom_attach,
        capabilities = capabilities,
    })
end

local function ts_on_attach(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({
        enable_import_on_completion = true,
        update_imports_on_move = true,
        require_confirmation_on_move = false,
    })
    ts_utils.setup_client(client)
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    custom_attach()
end
nlsp.tsserver.setup({
    init_options = require("nvim-lsp-ts-utils").init_options,
    capabilities = capabilities,
    on_attach = ts_on_attach,
})
nlsp.sumneko_lua.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
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
    },
})
nlsp.vls.setup({
    cmd = { "vlangls" },
    filetypes = { "vlang", "vsh" },
    on_attach = custom_attach,
    capabilities = capabilities,
})
nlsp.sourcekit.setup({
    filetypes = { "swift" },
    on_attach = custom_attach,
    capabilities = capabilities,
})
nlsp.jdtls.setup({
    cmd = { "jdtls" },
})
