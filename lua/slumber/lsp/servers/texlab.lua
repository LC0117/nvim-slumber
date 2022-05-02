local defaults = require('slumber.lsp.defaults')
local U = require('slumber.core.utils')
local forward_command = (function()
  if U.is_mac then
    return {
      executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
      args = { '%l', '%p', '%f' },
    }
  end
end)()

return {
  filetypes = { 'tex', 'plaintex', 'bib' },
  on_attach = defaults.on_attach,
  capabilities = defaults.capabilities,
  settings = {
    texlab = {
      forwardSearch = forward_command,
      auxDirectory = './out',
      build = {
        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f', '-xelatex' },
        executable = 'latexmk',
        forwardSearchAfter = true,
        onSave = false,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = true,
      },
    },
  },
}
