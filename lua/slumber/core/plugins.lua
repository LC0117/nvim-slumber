local editor = require('slumber.editor')
local ui = require('slumber.ui')
local tools = require('slumber.tools')
local lsp = require('slumber.lsp')

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
      return require('packer.util').float({ border = 'single' })
    end,
  },
  max_jobs = 20,
  git = {
    clone_timeout = 400,
  },
  --compile_path = vim.fn.stdpath("data") .. "/lazy" .. "/packer_compiled.lua",
})

packer.startup(function(use)
  use({ 'wbthomason/packer.nvim' })
  use({ 'nvim-lua/plenary.nvim' })
  use({ 'nvim-lua/popup.nvim' })

  -- editor framework
  use({ 'catppuccin/nvim', as = 'catppuccin', config = ui.cupcin })
  use({ 'startup-nvim/startup.nvim', config = editor.startup })
  use({ 'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime' })
  use({ 'rebelot/kanagawa.nvim', config = editor.kanagawa })
  use({ 'olimorris/onedarkpro.nvim', config = ui.onedarkpro })
  use({ 'Mofiqul/vscode.nvim' })
  use({ 'kyazdani42/nvim-web-devicons' })
  use({ 'rcarriga/nvim-notify', config = editor.notify })

  -- ui and editing
  use({ 'lukas-reineke/indent-blankline.nvim', opt = true, event = 'BufRead', config = ui.blankline })
  use({ 'nvim-lualine/lualine.nvim', event = 'BufRead', config = ui.lualine })
  use({ 'lewis6991/gitsigns.nvim', opt = true, event = { 'BufRead', 'BufNewFile' }, config = ui.gitsigns })
  use({ 'akinsho/bufferline.nvim', config = ui.bufferline, opt = true, event = 'BufRead' })
  use({ 'kyazdani42/nvim-tree.lua', opt = true, cmd = { 'NvimTreeToggle', 'NvimTreeOpen' }, config = ui.tree })
  use({ 'j-hui/fidget.nvim', event = 'BufReadPre', config = editor.fidget })

  -- treesitter things
  use({ 'nvim-treesitter/nvim-treesitter', event = 'BufRead', config = editor.treesitter })
  use({ 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter', config = editor.context })
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    config = editor.textobjects,
  })
  use({
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter',
    config = editor.commentstring,
  })
  use({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter', config = editor.rainbow })
  use({ 'andymass/vim-matchup', after = 'nvim-treesitter', config = editor.matchup })
  use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', config = editor.autotag })

  -- language and develop
  use({ 'udalov/kotlin-vim', ft = 'kotlin' })
  use({ 'keith/swift.vim', ft = 'swift' })
  use({ 'ollykel/v-vim', ft = { 'vlang', 'vsh' } })
  use({ 'JuliaEditorSupport/julia-vim' })
  use({
    'ionide/Ionide-vim',
    ft = { 'fsharp', 'fs', 'fsi', 'fsx' },
  })

  -- lsp and completion
  use({ 'neovim/nvim-lspconfig', event = 'BufReadPre' })
  use({ 'jose-elias-alvarez/null-ls.nvim', config = lsp.null_ls, after = 'nvim-lspconfig' })
  use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', after = 'nvim-lspconfig' })
  use({ 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' })
  use({
    'williamboman/nvim-lsp-installer',
    after = { 'lsp_signature.nvim', 'nvim-lsp-ts-utils' },
    config = lsp.lspconfig,
  })
  use({
    'tami5/lspsaga.nvim',
    event = 'BufRead',
    config = function()
      require('lspsaga').setup({
        border_style = 'round',
        code_action_prompt = {
          enable = true,
          sign = true,
          sign_priority = 60,
          virtual_text = false,
        },
      })
    end,
  })
  use({ 'rafamadriz/friendly-snippets' })
  use({
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').load()
    end,
  })
  use({
    'hrsh7th/nvim-cmp',
    config = lsp.compe,
    event = 'InsertEnter',
    requires = {
      { 'lukas-reineke/cmp-under-comparator' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'tzachar/cmp-tabnine', run = './install.sh', config = lsp.tabnine, cmd = 'Tabnine' },
    },
  })
  use({ 'windwp/nvim-autopairs', config = lsp.autopairs, after = 'nvim-cmp' })
  -- tools settings
  use({ 'ellisonleao/glow.nvim', opt = true, cmd = 'Glow', config = tools.glow })
  use({ 'michaelb/sniprun', opt = true, run = 'bash install.sh', cmd = { 'SnipRun', '\'<,\'>SnipRun', 'SnipInfo' } })
  use({ 'folke/todo-comments.nvim', opt = true, event = 'BufRead', config = tools.todo })
  use({ 'numToStr/Comment.nvim', opt = true, after = 'nvim-ts-context-commentstring', config = tools.comment })
  use({ 'kevinhwang91/nvim-hlslens', opt = true, event = 'BufRead', config = tools.hlslens })
  use({
    'akinsho/toggleterm.nvim',
    opt = true,
    cmd = { 'ToggleTerm', 'ToggleTermToggleAll' },
    config = tools.toggleterm,
  })
  use({ 'nvim-telescope/telescope.nvim', opt = true, cmd = 'Telescope', config = tools.telescope })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    opt = true,
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension('fzf')
    end,
  })
  use({
    'nvim-telescope/telescope-file-browser.nvim',
    opt = true,
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension('file_browser')
    end,
  })
end)
