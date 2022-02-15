local lsp_installer = require("nvim-lsp-installer")
local home = os.getenv("HOME")
local install_dir = home .. "/.local/share/nvim/lsp_servers"
local omnisharp_bin = install_dir .. "/omnisharp/omnisharp/OmniSharp.dll"
local groovyls_bin = install_dir .. "/groovyls/build/libs/groovyls-all.jar"
local fs_bin = "/Users/lichao/.local/share/nvim/lsp_servers/fsautocomplete/fsautocomplete"
local pid = vim.fn.getpid()

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})

local nvimls = require("lspconfig")

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
end

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
    "ocamllsp"
}

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

require("navigator").setup({
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    lsp_installer = true,
    lsp_signature_help = true,
    signature_help_cfg = {
        bind = true,
        floating_window = true,
        hint_enable = true,
        hi_parameter = "Search",
        hint_prefix = ": ",
        handler_opts = { border = "rounded" },
        transparency = 20,
    },
    icons = {
        code_action_icon = "💡"
    },
    on_attach = custom_attach,
    lsp = {
        format_on_save = false,
        servers = clients,
        disable_lsp = { "denols", "pyright", "jedi-language-server", "ccls" },
        texlab = {
            filetypes = { "tex", "plaintex", "latex", "bib", "bibtex" },
            settings = {
                texlab = {
                    build = {
                        executable = "latexmk",
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-pvc", "-xelatex" },
                        onSave = true,
                        forwardSearchAfter = true,
                        isContinuous = true,
                    },
                    forwardSearch = {
                        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                        args = { "%l", "%p", "%f" },
                    },
                },
            },
        },
        groovyls = { cmd = { "java", "-jar", groovyls_bin } },
        vls = { cmd = { "vlangls" }, filetypes = { "vlang", "vsh" } },
        haxe_language_server = { cmd = { "node", "~/.local/opt/haxe/server.js" } },
        sourcekit = {
            cmd = { "sourcekit-lsp" },
            filetypes = { "swift" },
            on_attach = custom_attach()
        },
        tsserver = {
            init_options = require("nvim-lsp-ts-utils").init_options,
            on_attach = ts_on_attach,
            --filetypes = { "typescript", "typescript.tsx", "typescriptreact" }
        },
        flow = { cmd = { "flow", "lsp" } },
        fsautocomplete = { cmd = { fs_bin, "--background-service-enabled" }, filetypes = {"fsharp"} },
        sumneko_lua = {
            on_attach = custom_attach,
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
        },
        omnisharp = { cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) } },
    },
})

nvimls.fsautocomplete.setup{
    cmd = { fs_bin, "--background-service-enabled"},
    on_attach = custom_attach
}
