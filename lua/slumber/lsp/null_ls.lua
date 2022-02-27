local bf = require("null-ls").builtins.formatting
local bd = require("null-ls").builtins.diagnostics
local ba = require("null-ls").builtins.code_actions
local methods = require("null-ls").methods
-- a lot of builtin sources
local sources_users = {
    ba.eslint_d,
    ba.shellcheck,
    bf.clang_format,
    bf.cmake_format,
    bf.gofmt,
    bf.google_java_format,
    bf.shfmt,
    bf.stylua.with({
        condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
        end,
    }),
    bf.swiftformat,
    bf.taplo,
    bf.uncrustify.with({
        filetypes = { "cs", "csharp" },
    }),
    bd.php,
    bf.prettierd.with({
        filetypes = { "markdown" },
    }),
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
    sources = sources_users,
})
