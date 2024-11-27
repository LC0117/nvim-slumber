local nlsp = require('lspconfig')
local defaults = require('slumber.lsp.defaults')

local clients = {
  'zls',
  'r_language_server',
  'ocamllsp',
  'lemminx',
  'sorbet',
  'taplo',
  'volar',
  'pyright',
  'kotlin_language_server',
  'omnisharp',
  'vls',
  'groovyls',
  'clojure_lsp',
  'phpactor',
  'erlangls',
  'qmlls',
  'neocmake',
  'vala_ls',
  'perlnavigator',
  'html',
  'cssls',
  'julials',
  'ruff',
  'fsautocomplete',
  'mesonlsp'
}

for _, lsp in ipairs(clients) do
  nlsp[lsp].setup({
    capabilities = defaults.capabilities,
  })
end

nlsp.elixirls.setup({
  cmd = { 'elixir-ls' },
  capabilities = defaults.capabilities,
})

nlsp.denols.setup({
  capabilities = defaults.capabilities,
  root_dir = nlsp.util.root_pattern('deno.json'),
  init_options = {
    lint = true,
  },
})

nlsp.lua_ls.setup({
  capabilities = defaults.capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim', 'packer_plugins' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = { enable = false },
    },
  },
})

nlsp.sourcekit.setup({
  filetypes = { 'swift' },
  capabilities = defaults.capabilities,
})

nlsp.clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
    '-j=12',
    '--clang-tidy',
    '--completion-style=detailed',
    '--inlay-hints',
    '--enable-config',
  },
  capabilities = defaults.capabilities,
})

nlsp.hls.setup({
  capabilities = defaults.capabilities,
  settings = {
    haskell = {
      formattingProvider = 'stylish-haskell',
    },
  },
})

nlsp.gopls.setup({
  capabilities = defaults.capabilities,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      staticcheck = true,
    },
  },
})

nlsp.rust_analyzer.setup({
  capabilities = defaults.capabilities,
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = 'clippy',
        features = 'all',
      },
    },
  },
})

nlsp.ts_ls.setup({
  root_dir = nlsp.util.root_pattern('package.json'),
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

nlsp.jsonls.setup({
  capabilities = defaults.capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

nlsp.texlab.setup(require('slumber.lsp.servers.texlab'))
