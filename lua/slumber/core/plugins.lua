local editor = require("slumber.editor")
local ui = require("slumber.ui")
local tools = require("slumber.tools")
local lsp = require("slumber.lsp")
local lang = require("slumber.lang")

local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
    max_jobs = 20,
    git = {
        clone_timeout = 400,
    },
    --compile_path = vim.fn.stdpath("data") .. "/lazy" .. "/packer_compiled.lua",
})

packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "nvim-lua/popup.nvim" })
    use({ "tami5/sqlite.lua" })

    -- editor framework
    use({ "folke/tokyonight.nvim", config = ui.tokyo })
    use({ "catppuccin/nvim", as = "catppuccin", config = ui.cupcin })
    use({ "startup-nvim/startup.nvim", config = editor.startup })
    use({ "dstein64/vim-startuptime", opt = true, cmd = "StartupTime" })
    use({ "kyazdani42/nvim-web-devicons" })

    -- ui and editing
    use({ "lukas-reineke/indent-blankline.nvim", opt = true, event = "BufRead", config = ui.blankline })
    use({ "nvim-lualine/lualine.nvim", opt = true, after = "lualine-lsp-progress", config = ui.lualine })
    use({ "arkav/lualine-lsp-progress", opt = true, after = "nvim-gps" })
    use({ "lewis6991/gitsigns.nvim", opt = true, event = { "BufRead", "BufNewFile" }, config = ui.gitsigns })
    use({ "akinsho/bufferline.nvim", config = ui.bufferline, opt = true, event = "BufRead" })
    use({ "kyazdani42/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle", "NvimTreeOpen" }, config = ui.tree })

    -- treesitter things
    use({ "nvim-treesitter/nvim-treesitter", opt = true, event = "BufRead", config = editor.treesitter })
    use({ "romgrk/nvim-treesitter-context", opt = true, after = "nvim-treesitter", config = editor.context })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        opt = true,
        after = "nvim-treesitter",
        config = editor.textobjects,
    })
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        opt = true,
        after = "nvim-treesitter",
        config = editor.commentstring,
    })
    use({ "p00f/nvim-ts-rainbow", opt = true, after = "nvim-treesitter", config = editor.rainbow })
    use({ "andymass/vim-matchup", opt = true, after = "nvim-treesitter", config = editor.matchup })
    use({ "windwp/nvim-ts-autotag", opt = true, after = "nvim-treesitter", config = editor.autotag })
    use({ "SmiteshP/nvim-gps", opt = true, after = "nvim-treesitter", config = editor.gps })
    use({
        "nvim-treesitter/nvim-treesitter-refactor",
        opt = true,
        after = "nvim-treesitter",
        config = editor.refractor,
    })
    use({
        "lewis6991/spellsitter.nvim",
        opt = true,
        after = "nvim-treesitter",
        config = function()
            require("spellsitter").setup({
                enable = true,
                spellchecker = "vimfn",
            })
        end,
    })

    -- language and develop
    use({ "mfussenegger/nvim-dap", opt = true, event = "BufReadPre", config = lang.dap })
    use({ "rcarriga/nvim-dap-ui", opt = true, after = "nvim-dap", config = lang.dapui })
    use({ "theHamsta/nvim-dap-virtual-text", opt = true, after = "nvim-dap", config = lang.daptext })
    use({ "simrat39/rust-tools.nvim", opt = true, ft = "rust", config = lang.rust_tools })
    use({ "akinsho/flutter-tools.nvim", opt = true, ft = "dart", config = lang.flutter_tools })
    use({ "ray-x/go.nvim", opt = true, event = "BufRead *.go", config = lang.go })
    use({ "Saecki/crates.nvim", opt = true, event = "BufRead Cargo.toml", after = "nvim-cmp", config = lang.crate })
    use({ "scalameta/nvim-metals", opt = true, event = { "BufRead *.scala", "BufRead *.sbt" }, config = lang.scala })
    use({ "mfussenegger/nvim-jdtls", opt = true, ft = "java", config = lang.jdtls })
    use({ "udalov/kotlin-vim", ft = "kotlin" })

    -- lsp and completion
    use({
        "neovim/nvim-lspconfig",
        opt = true,
        after = { "lspsaga.nvim", "lsp_signature.nvim", "nvim-lsp-installer" },
        config = lsp.lspconfig,
    })
    use({ "jose-elias-alvarez/null-ls.nvim", opt = true, after = "nvim-lspconfig", config = lsp.null_ls })
    use({ "tami5/lspsaga.nvim", opt = true, event = "BufReadPre" })
    use({ "ray-x/lsp_signature.nvim", opt = true, event = "BufReadPre" })
    use({ "rafamadriz/friendly-snippets" })
    use({
        "hrsh7th/nvim-cmp",
        event = "BufRead",
        config = lsp.compe,
        requires = {
            { "lukas-reineke/cmp-under-comparator" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
            { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
            { "andersevenrud/compe-tmux", branch = "cmp", after = "cmp-nvim-lua" },
            { "hrsh7th/cmp-path", after = "compe-tmux" },
            { "f3fora/cmp-spell", after = "cmp-path" },
            { "hrsh7th/cmp-buffer", after = "cmp-spell" },
            { "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
            { "hrsh7th/cmp-emoji", after = "cmp-buffer" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            { "tzachar/cmp-tabnine", run = "./install.sh", config = lsp.tabnine, opt = true },
            { "petertriho/cmp-git", after = "cmp_luasnip", config = lsp.cmp_git },
        },
    })
    use({ "L3MON4D3/LuaSnip", after = "nvim-cmp", config = lsp.luasnip })
    use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = lsp.autopairs })
    use({ "williamboman/nvim-lsp-installer", opt = true, event = "BufReadPre" })

    -- tools settings
    use({ "mrjones2014/dash.nvim", opt = true, run = "make install", cmd = { "Dash", "DashWord" } })
    use({ "ellisonleao/glow.nvim", opt = true, cmd = "Glow", config = tools.glow })
    use({ "michaelb/sniprun", opt = true, run = "bash install.sh", cmd = { "SnipRun", "'<,'>SnipRun", "SnipInfo" } })
    use({ "folke/trouble.nvim", opt = true, cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" } })
    use({ "folke/todo-comments.nvim", opt = true, event = "BufRead", config = tools.todo })
    use({
        "nvim-neorg/neorg",
        setup = vim.cmd("autocmd BufRead,BufNewFile *.norg setlocal filetype=norg"),
        after = "nvim-treesitter",
        ft = "norg",
        config = tools.neorg,
    })
    use({ "nvim-neorg/neorg-telescope", opt = true, after = "telescope.nvim" })
    use({ "numToStr/Comment.nvim", opt = true, after = "nvim-ts-context-commentstring", config = tools.comment })
    use({ "kevinhwang91/nvim-hlslens", opt = true, event = "BufRead", config = tools.hlslens })
    use({
        "akinsho/toggleterm.nvim",
        opt = true,
        cmd = { "ToggleTerm", "ToggleTermToggleAll" },
        config = tools.toggleterm,
    })
    use({ "nvim-telescope/telescope.nvim", opt = true, cmd = "Telescope", config = tools.telescope })
    use({ "pwntester/octo.nvim", opt = true, after = "telescope.nvim", config = tools.octo })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    })
    use({
        "nvim-telescope/telescope-project.nvim",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("project")
        end,
    })
    use({
        "nvim-telescope/telescope-frecency.nvim",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("frecency")
        end,
    })
    use({
        "jvgrootveld/telescope-zoxide",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("zoxide")
        end,
    })
    use({
        "nvim-telescope/telescope-packer.nvim",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("packer")
        end,
    })
    use({
        "cljoly/telescope-repo.nvim",
        opt = true,
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("repo")
        end,
    })
end)
