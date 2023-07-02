local U = require('slumber.core.utils')
local path = U.path
local server_root = path.concat(vim.fn.stdpath('data'), 'mason', 'packages', 'jdtls')
local fn = vim.fn
local lombok = fn.expand(path.concat(server_root, 'lombok.jar'))
local workspace_root = fn.expand(path.concat(fn.stdpath('cache'), 'jdtls-workspace'))
local workspace_dir = path.concat(workspace_root, fn.fnamemodify(fn.getcwd(), ':p:h:t'))
local defaults = require('slumber.lsp.defaults')
local java_debug_path =
  path.concat(U.mason_package, 'java-debug-adapter', 'extension', 'server', 'com.microsoft.java.debug.plugin-*.jar')
local java_test_path = path.concat(U.mason_package, 'java-test', 'extension', 'server', '*.jar')
local jar_patterns = {
  java_debug_path,
  java_test_path,
}

local runtimes, ok = require('slumber.platform.java-runtimes')
if not ok then
  runtimes = {}
end

local java_settings = {
  configuration = {
    runtimes = runtimes,
  },
  inlayHints = {
    parameterNames = {
      enabled = 'all',
    },
  },
}
local bundle_path = {}
for _, jar_pattern in ipairs(jar_patterns) do
  for _, bundle in ipairs(vim.split(fn.glob(jar_pattern), '\n')) do
    if not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar') then
      table.insert(bundle_path, bundle)
    end
  end
end

local jdtls = require('jdtls')
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
jdtls.start_or_attach({
  cmd = { 'jdtls', '-javaagent', lombok, '-data', workspace_dir },
  settings = {
    java = java_settings,
  },
  init_options = {
    bundles = bundle_path,
    extendedClientCapabilities = extendedClientCapabilities,
  },
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
  on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto' })
    jdtls.setup.add_commands()
    defaults.on_attach(client, bufnr)
  end,
})
