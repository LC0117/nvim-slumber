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
  -- formatter for c and cpp
  bf.clang_format.with({
    filetypes = { 'c', 'cpp' },
  }),
  -- haskell formatter
  bf.fourmolu,
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
  -- make file linter
  bd.checkmake,
  -- spellchecker
  bd.cspell.with({
    filetypes = { 'java', 'python', 'py' },
  }),
  -- php internal linter
  bd.php,
  -- cpp linter
  bd.cppcheck,
  -- js, ts, jsx, ysx linter
  bd.eslint,
  -- go linter
  bd.golangci_lint,
  bd.revive,
  -- add fish lint rules
  bd.fish,
  -- dockerfile helper
  bd.hadolint,
  -- shell script checker
  bd.shellcheck,
  -- kotlin linter
  bd.ktlint,
  -- ruby checker
  bd.rubocop,
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
