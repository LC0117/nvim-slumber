local map = require('slumber.core.utils').map
local nmap = map.n
local vmap = map.v
local nimap = map.ni
local xomap = map.xo
local nxomap = map.nxo

-- telescope settings
-- find file
nmap('<leader>ff', [[:Telescope fd<CR>]])
-- find word
nmap('<leader>fw', [[:Telescope live_grep<CR>]])

-- lsp things
nmap('<leader>lf', vim.lsp.buf.format)
nmap('<leader>ca', vim.lsp.buf.code_action)
--vmap('<leader>ca', vim.lsp.buf.range_code_action, {buffer=true})
nmap('<leader>lr', vim.lsp.buf.rename)

nmap('<C-Q>', [[<Cmd>qall!<CR>]])
nmap('<C-S>', [[:wall<CR>]])
nmap('<leader>w', [[:w<CR>]])

nmap('K', vim.lsp.buf.hover)

-- NvimTree settings
-- tree focus
nmap('<leader>tf', [[:Neotree focus<CR>]])
-- tree toggle
nmap('<leader>tt', [[:Neotree toggle<CR>]])
-- tree gitstatus
nmap('<leader>tg', [[:Neotree git_status<CR>]])

-- gitsigns settings
nmap('<leader>gb', [[:Gitsigns blame_line<CR>]])
nmap('<leader>gt', [[:Gitsigns toggle_current_line_blame<CR>]])

-- bufferline mappings
nmap('b]', [[:BufferLineCycleNext<CR>]])
nmap('b[', [[:BufferLineCyclePrev<CR>]])
nmap('bp', [[:BufferLineTogglePin<CR>]])

-- utils
nmap(',d', [[:set background=dark<CR>]])
nmap(',l', [[:set background=light<CR>]])

-- treesitter-textobjects
local select = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.select').select_textobject(unpack(args))
  end
end

local swap_next = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.swap').swap_next(unpack(args))
  end
end

local swap_prev = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.swap').swap_prev(unpack(args))
  end
end

local move_next_start = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_next_start(unpack(args))
  end
end

local move_next_end = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_next_end(unpack(args))
  end
end

local move_previous_start = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_previous_start(unpack(args))
  end
end

local move_previous_end = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_previous_end(unpack(args))
  end
end
local move_next = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_next(unpack(args))
  end
end

local move_previous = function(...)
  local args = { ... }
  return function()
    require('nvim-treesitter-textobjects.move').goto_previous(unpack(args))
  end
end

xomap('af', select('@function.outer', 'textobjects'))
xomap('if', select('@function.inner', 'textobjects'))
xomap('ac', select('@class.outer', 'textobjects'))
xomap('ic', select('@class.inner', 'textobjects'))
xomap('as', select('@local.scope', 'locals'))

nmap('<leader>a', swap_next('@parameter.inner'))
nmap('<leader>A', swap_prev('@parameter.outer'))

nxomap(']f', move_next_start('@function.outer', 'textobjects'))
nxomap(']]', move_next_start('@class.outer', 'textobjects'))
nxomap(']o', move_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects'))
nxomap(']s', move_next_start('@local.scope', 'locals'))
nxomap(']z', move_next_start('@fold', 'folds'))
nxomap(']F', move_next_end('@function.outer', 'textobjects'))
nxomap('][', move_next_end('@class.outer', 'textobjects'))
nxomap('[f', move_previous_start('@function.outer', 'textobjects'))
nxomap('[[', move_previous_start('@class.outer', 'textobjects'))
nxomap('[F', move_previous_end('@function.outer', 'textobjects'))
nxomap('[]', move_previous_end('@class.outer', 'textobjects'))
nxomap(']d', move_next('@conditional.outer', 'textobjects'))
nxomap('[d', move_previous('@conditional.outer', 'textobjects'))
