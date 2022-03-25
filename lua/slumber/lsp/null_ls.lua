local bf = require('null-ls').builtins.formatting
local bd = require('null-ls').builtins.diagnostics
local ba = require('null-ls').builtins.code_actions
local bc = require('null-ls').builtins.completion
-- a lot of builtin sources
local sources_users = {
  ba.eslint,
  ba.shellcheck,
  bc.tags,
  bf.black,
  bf.clang_format.with({
    filetypes = { 'c', 'cpp' },
  }),
  bf.fourmolu,
  bf.cmake_format,
  bf.gofmt,
  bf.google_java_format,
  bf.ktlint,
  bf.latexindent,
  bf.perltidy,
  bf.pg_format,
  bf.remark,
  bf.scalafmt,
  bf.shfmt,
  bf.stylua.with({
    condition = function(utils)
      return utils.root_has_file({ 'stylua.toml', '.stylua.toml' })
    end,
  }),
  bf.stylelint,
  bf.swiftformat,
  bf.taplo,
  bf.uncrustify.with({
    filetypes = { 'cs', 'csharp' },
  }),
  bf.prettierd.with({
    filetypes = { 'markdown' },
  }),
  bd.chktex,
  bd.checkmake,
  bd.cspell.with({
    filetypes = { 'java', 'python', 'py' },
  }),
  bd.php,
  bd.cppcheck,
  bd.eslint,
  bd.golangci_lint,
  bd.revive,
  bd.selene,
  bd.shellcheck,
  bd.stylelint,
  bd.vint,
}
require('null-ls').setup({
  sources = sources_users,
})
