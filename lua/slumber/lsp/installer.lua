local installer = require('nvim-lsp-installer')
local defaults = require('slumber.lsp.defaults')

installer.settings({
  ui = {
    icons = {
      server_installed = '',
      server_pending = '',
      server_uninstalled = '',
    },
  },
})

installer.on_server_ready(function(server)
  if server.name == 'jdtls' then
  else
    local opts = {}
    opts.on_attach = defaults.on_attach
    opts.capabilities = defaults.capabilities
    if server.name == 'sumneko_lua' then
      opts = require('slumber.lsp.servers.sumneko_lua')
    elseif server.name == 'tsserver' then
      opts = require('slumber.lsp.servers.tsserver')
    elseif server.name == 'jsonls' then
      opts = require('slumber.lsp.servers.jsonls')
    elseif server.name == 'tailwindcss' then
      opts = require('lua.slumber.lsp.servers.tailwindcss')
    end
    server:setup(opts)
  end
end)
