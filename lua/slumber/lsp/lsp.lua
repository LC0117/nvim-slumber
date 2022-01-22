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

local function custom_attach()
    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        hint_enable = true,
        hi_parameter = "Search",
        hint_prefix = ": ",
        handler_opts = { border = "rounded" },
        transparency = 20,
    })
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "ltex" then
        opts.filetypes = {"tex", "latex", "bib"}
    end
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
    "spectral",
    "r_language_server",
    "fortls",
    "html",
    "cssls",
    "svls",
    "typeprof",
}

local function ts_on_attach(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup{
        enable_import_on_completion = true,
        update_imports_on_move = true,
        require_confirmation_on_move = false
    }
    ts_utils.setup_client(client)
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    custom_attach()
end

require("navigator").setup{
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    lsp_installer = true,
    lsp_signature_help = true,
    signature_help_cfg = {
         bind = true,
        floating_window = true,
        hint_enable = true,
        hi_parameter = "Search",
        hint_prefix = ": ",
        handler_opts = { border = "rounded" },
        transparency = 20
    },
    on_attach = custom_attach,
    lsp = {
        format_on_save = false,
        servers = clients,
        texlab = {
            filetypes = { "tex", "plaintex", "latex", "bib", "bibtex" },
            settings = {
                texlab = {
                    build = {
                        executable = "latexmk",
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-pvc", "-xelatex" },
                        onSave = true,
                        forwardSearchAfter = true,
                        isContinuous = true
                    },
                    forwardSearch = {
                        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                        args = { "%l", "%p", "%f" }
                    }
                }
            }
        },
        vls = { cmd = {"vlangls"} },
        haxe_language_server = { cmd = { "node", "~/.local/opt/haxe/server.js" } },
        sourcekit = { filetypes = {"swift"} },
        tsserver = {
            init_options = require("nvim-lsp-ts-utils").init_options,
            on_attach = ts_on_attach
        },
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
                telemetry = { enable = false }
                }
            }
        }
    }
}

