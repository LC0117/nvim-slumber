local lsp = vim.api.nvim_create_augroup('LSP', { clear = true })
local defaults = require('slumber.lsp.defaults')

-- clangd client setting
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  callback = function()
    local root = vim.fs.find({
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      '.git',
    }, { upward = true })
    vim.lsp.start({
      name = 'clangd',
      cmd = {
        'clangd',
        '--background-index',
        '-j=12',
        '--clang-tidy',
        '--completion-style=detailed',
        '--inlay-hints',
        '--enable-config',
      },
      root_dir = vim.fs.dirname(root[1]),
      capabilities = defaults.capabilities,
    })
  end,
})

-- jsonls setup
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = { 'json', 'jsonc' },
  callback = function()
    local root = vim.fs.find({ '.git' }, { upward = true })
    vim.lsp.start({
      name = 'jsonls',
      cmd = { 'vscode-json-language-server', '--stdio' },
      init_options = {
        provideFormatter = false,
      },
      root_dir = next(root) and vim.fs.dirname(root[1]) or vim.fn.getcwd(),
      capabilities = defaults.capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
})

-- typescript-language-server and denols
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'javascript.jsx',
    'typescript.tsx',
  },
  callback = function()
    local npm_root = vim.fs.find({ 'package.json' }, { upward = true })
    local deno_root = vim.fs.find({ 'deno.json', 'deno.jsonc' }, { upward = true })
    if next(npm_root) then
      vim.lsp.start({
        name = 'tsserver',
        cmd = { 'typescript-language-server', '--stdio' },
        root_dir = vim.fs.dirname(npm_root[1]),
        capabilities = defaults.capabilities,
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
    elseif next(deno_root) then
      local function buf_cache(bufnr, client)
        local params = {}
        params['referrer'] = { uri = vim.uri_from_bufnr(bufnr) }
        params['uris'] = {}
        client.request_sync('deno/cache', params)
      end

      local function handle_virtual_text_doc(uri, res, client)
        if not res then
          return nil
        end
        local lines = vim.split(res.result, '\n')
        local bufnr = vim.uri_to_bufnr(uri)
        local current_buf = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        if #current_buf ~= 0 then
          return nil
        end
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, nil, lines)
        vim.api.nvim_buf_set_option(bufnr, 'readonly', true)
        vim.api.nvim_buf_set_option(bufnr, 'modified', false)
        vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
        vim.lsp.buf_attach_client(bufnr, client.id)
      end

      local function virtual_text_doc(uri, client)
        local params = {
          textDocument = {
            uri = uri,
          },
        }
        local result = client.request_sync('deno/virtualTextDocument', params)
        handle_virtual_text_doc(uri, result, client)
      end

      local function denols_handler(err, result, ctx)
        if not result or vim.tbl_isempty(result) then
          return nil
        end

        local client = vim.lsp.get_client_by_id(ctx.client_id)
        for _, res in pairs(result) do
          local uri = res.uri or res.targetUri
          if uri:match('^deno:') then
            virtual_text_doc(uri, client)
            res['uri'] = uri
            res['targetUri'] = uri
          end
        end

        vim.lsp.handlers[ctx.method](err, result, ctx)
      end

      vim.lsp.start({
        name = 'denols',
        cmd = { 'deno', 'lsp' },
        root_dir = vim.fs.dirname(deno_root[1]),
        init_options = {
          enable = true,
          unstable = true,
        },
        handlers = {
          ['textDocument/definition'] = denols_handler,
          ['textDocument/references'] = denols_handler,
          ['workspace/executeCommand'] = function(err, result, context)
            if context.params.command == 'deno.cache' then
              buf_cache(context.bufnr, vim.lsp.get_client_by_id(context.client_id))
            else
              vim.lsp.handlers[context.method](err, result, context)
            end
          end,
        },
        commands = {
          DenolsCache = {
            function()
              local clients = vim.lsp.get_active_clients()
              for _, client in ipairs(clients) do
                if client.name == 'denols' then
                  buf_cache(0, client)
                  break
                end
              end
            end,
            description = 'Cache a module and all of its dependencies.',
          },
        },
      })
    else
      return
    end
  end,
})

-- haskell language server setup
vim.api.nvim_create_autocmd('FileType', {
  group = lsp,
  pattern = { 'haskell', 'lhaskell' },
  callback = function()
    local stack_root = vim.fs.find({ 'stack.yaml' }, { upward = true })
    local cabal_root = vim.fs.find({ 'dist-newstyle' }, { upward = true })
    vim.lsp.start({
      name = 'haskell-language-server',
      cmd = { 'haskell-language-server-wrapper', '--lsp' },
      root_dir = next(stack_root) and vim.fs.dirname(stack_root[1]) or next(cabal_root) and vim.fs.dirname(
        cabal_root[1]
      ) or vim.fn.getcwd(),
      settings = {
        haskell = {
          formattingProvider = 'stylish-haskell',
        },
      },
    })
  end,
})
