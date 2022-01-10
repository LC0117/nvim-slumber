local b = require("null-ls").builtins
local bf = require("null-ls").builtins.formatting
local bd = require("null-ls").builtins.diagnostics
local ba = require("null-ls").builtins.code_actions
-- a lot of builtin sources
local sources_users = {
    b.code_actions.gitsigns.with({
        --disabled_filetypes = {"lua"}
    }),
    ba.eslint_d,
    ba.shellcheck,
    bf.clang_format,
    bf.cmake_format,
    bf.codespell.with({
        extra_args = { "-I", "~/Proj/dict/codespell.txt" },
    }),
    bf.deno_fmt,
    bf.gofmt,
    bf.google_java_format,
    bf.rustfmt,
    bf.shfmt,
    bf.stylua,
    bf.swiftformat,
    bf.taplo,
    bf.uncrustify,
    bf.eslint_d,
    bd.php,
    bf.prettierd,
    bd.chktex,
    bd.codespell.with({
        extra_args = { "-I", "~/Proj/dict/codespell.txt" },
    }),
    bd.cppcheck,
    bd.eslint_d,
    bd.golangci_lint,
    bd.shellcheck,
    bd.vint,
}
require("null-ls").setup({
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
    sources = sources_users,
})
