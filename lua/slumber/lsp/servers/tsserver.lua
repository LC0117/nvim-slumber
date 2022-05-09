local M = {}
local defaults = require('slumber.lsp.defaults')

M.init_options = require('nvim-lsp-ts-utils').init_options

function M.on_attach(client, bufnr)
  local ts_utils = require('nvim-lsp-ts-utils')

  -- defaults
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = true,
    import_all_timeout = 5000,
    import_all_priorities = {
      buffers = 4,
      buffer_content = 3,
      local_files = 2,
      same_file = 1,
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,
    auto_inlay_hints = true,
    inlay_hints_highlight = 'Comment',
    update_imports_on_move = true,
    require_confirmation_on_move = false,
    watch_dir = nil,
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
  })
  ts_utils.setup_client(client)
  defaults.on_attach(client, bufnr)
end

M.capabilities = defaults.capabilities
M.root_dir = require('lspconfig').util.root_pattern('package.json')

return M
