local M = {}
local themes = require('telescope.themes')
local builtin = require('telescope.builtin')

function M.code_action()
  local opts = {
    layout_config = {
      height = 15,
    },
  }
  builtin.lsp_code_actions(themes.get_cursor(opts))
end

function M.range_code_action()
  local opts = {
    layout_config = {
      height = 15,
    },
  }
  builtin.lsp_range_code_actions(themes.get_cursor(opts))
end

function M.buf_find()
  local opts = {
    previewer = false,
    width = 0.5,
    height = 0.5,
    prompt_prefix = [[  ]],
  }
  builtin.current_buffer_fuzzy_find(themes.get_dropdown(opts))
end

return M
