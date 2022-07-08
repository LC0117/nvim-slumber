local U = require('slumber.core.utils')
local path = U.path
local server_root = path.concat({ vim.fn.stdpath('data'), 'lsp_servers', 'jdtls' })
local fn = vim.fn
local jar = fn.expand(path.concat({ server_root, 'plugins', 'org.eclipse.equinox.launcher_*.jar' }))
local lombok = fn.expand(path.concat({ server_root, 'lombok.jar' }))
local workspace_root = fn.expand(path.concat({ fn.stdpath('cache'), 'jdtls-workspace' }))
local workspace_dir = path.concat({ workspace_root, fn.fnamemodify(fn.getcwd(), ':p:h:t') })
local dapers_path = path.concat({ fn.stdpath('data'), 'dapers' })
local defaults = require('slumber.lsp.defaults')
local java_debug_path = path.concat({
  dapers_path,
  'java-debug',
  'com.microsoft.java.debug.plugin',
  'target',
  'com.microsoft.java.debug.plugin-*.jar',
})
local java_test_path = path.concat({ dapers_path, 'vscode-java-test', 'server', '*.jar' })
local jar_patterns = {
  java_debug_path,
  java_test_path,
}
local config_option = (function()
  if U.is_mac then
    return path.concat({ server_root, 'config_mac' })
  elseif U.is_linux then
    return path.concat({ server_root, 'config_linux' })
  elseif U.is_windows then
    return path.concat({ server_root, 'config_win' })
  end
end)()

local command = {
  'java',
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-Xms100M',
  '-Xmx2G',
  '-javaagent:' .. lombok,
  '--add-modules=ALL-SYSTEM',
  '--add-opens',
  'java.base/java.util=ALL-UNNAMED',
  '--add-opens',
  'java.base/java.lang=ALL-UNNAMED',
  '-jar',
  jar,
  '-configuration',
  config_option,
  '-data',
  workspace_dir,
}

local java_settings = {
  configuration = {
    runtimes = U.is_mac and {
      {
        name = 'JavaSE-17',
        path = '/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home/',
      },
      {
        name = 'JavaSE-18',
        path = '/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/',
      },
      {
        name = 'JavaSE-11',
        path = '/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/',
      },
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
  cmd = command,
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
