local bf = require('null-ls').builtins.formatting
local bd = require('null-ls').builtins.diagnostics
local ba = require('null-ls').builtins.code_actions
local bc = require('null-ls').builtins.completion
-- a lot of builtin sources
local sources_users = {
  ba.eslint.with({
    condition = function(utils)
      return utils.root_has_file({ 'package.json' })
    end,
  }),
  ba.shellcheck,
  bc.tags,
  bf.black,
  -- cmake
  bf.cmake_format,
  -- java
  bf.google_java_format,
  -- kotlin
  bf.ktlint,
  -- latex
  bf.latexindent,
  -- perl
  bf.perltidy,
  -- sql
  bf.sqlfluff,
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
  bf.qmlformat,
  bd.chktex,
  -- make file linter
  bd.checkmake,
  -- go linter
  bd.golangci_lint,
  -- add fish lint rules
  bd.fish,
  -- dockerfile helper
  bd.hadolint,
  -- qt
  bd.qmllint,
  -- shell script checker
  bd.shellcheck,
  -- kotlin linter
  bd.ktlint,
  -- css linter
  bd.stylelint,
  -- vimscript linter
  bd.vint,
  -- sql stuff
  bd.sqlfluff,
}
require('null-ls').setup({
  sources = sources_users,
})
