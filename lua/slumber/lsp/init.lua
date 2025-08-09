local severity = vim.diagnostic.severity
vim.diagnostic.config({
  virtual_text = {
    prefix = [[ ]],
    format = function(diagnostic)
      if diagnostic.severity == severity.ERROR then
        return string.format('ERROR: %s', diagnostic.message)
      elseif diagnostic.severity == severity.HINT or diagnostic.severity == severity.INFO then
        return string.format('NOTE: %s', diagnostic.message)
      elseif diagnostic.severity == severity.WARN then
        return string.format('WARNING: %s', diagnostic.message)
      end
      return diagnostic.message
    end,
  },
  virtual_lines = {
    current_line = true,
  },
  float = {
    border = 'rounded',
  },
  signs = {
    text = {
      [severity.ERROR] = ' ',
      [severity.WARN] = ' ',
      [severity.INFO] = ' ',
      [severity.HINT] = ' ',
    },
  },
})

local kinds = vim.lsp.protocol.CompletionItemKind
local icons = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = ' ',
  Variable = '󰫧 ',
  Class = ' ',
  Interface = ' ',
  Module = '󰕳 ',
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = ' ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = ' ',
}
for index, _ in pairs(kinds) do
  kinds[index] = icons[index]
end

require('slumber.lsp.events')
require('slumber.lsp.setup')
