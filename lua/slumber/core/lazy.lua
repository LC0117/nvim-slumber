local function get_repos(m)
  local tmp = {}
  for repo, conf in pairs(m) do
    tmp[#tmp + 1] = vim.tbl_extend('force', { repo }, conf)
  end
  return tmp
end

local function concat_all(...)
  local arg = { ... }
  local repos = {}
  for i = 1, #arg do
    for _, value in ipairs(arg[i]) do
      table.insert(repos, value)
    end
  end
  return repos
end

local ui = get_repos(require('slumber.plugins.ui'))
local colorschemes = get_repos(require('slumber.plugins.colorscheme'))
local coding = get_repos(require('slumber.plugins.coding'))
local tools = get_repos(require('slumber.plugins.tools'))
local lsp = get_repos(require('slumber.plugins.lsp'))
local essentials = get_repos(require('slumber.plugins.commons'))
local plugins = concat_all(essentials, ui, colorschemes, coding, tools, lsp)
require('lazy').setup(plugins, {
  ui = {
    border = 'rounded',
  },
  concurrency = 20,
})
