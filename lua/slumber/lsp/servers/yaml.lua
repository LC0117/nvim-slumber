local defaults = require("slumber.lsp.defaults")
require("telescope").load_extension("yaml_schema")
local config = require("yaml-companion").setup({
  lspconfig = {
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities
  }
})
require("lspconfig").yamlls.setup(config)
