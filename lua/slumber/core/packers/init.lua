local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

local packer = require('packer')
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
  max_jobs = 20,
  git = {
    clone_timeout = 400,
  },
  luarocks = {
    python_cmd = 'python3',
  },
})

local function get_repos(m)
  local tmp = {}
  for repo, conf in pairs(m) do
    tmp[#tmp + 1] = vim.tbl_extend('force', { repo }, conf)
  end
  return tmp
end

local tools = get_repos(require('slumber.core.packers.tools'))
local lang = get_repos(require('slumber.core.packers.lang'))
local essentials = get_repos(require('slumber.core.packers.essentials'))
local ui = get_repos(require('slumber.core.packers.ui'))

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

local use = packer.use
local plugin_lists = concat_all(essentials, lang, ui, tools)
for _, repo in ipairs(plugin_lists) do
  use(repo)
end
