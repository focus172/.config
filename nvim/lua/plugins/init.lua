return {
    { "folke/lazy.nvim",                tag = "stable" },
    { "neovim/nvim-lspconfig",          dependencies = "nlsp-settings.nvim" },
    { "tamago324/nlsp-settings.nvim",   cmd = "LspSettings" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "Tastyep/structlog.nvim", },
    { "nvim-lua/plenary.nvim",          cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" } },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        cmd = "Telescope",
        dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
        config = function()
            require("lvim.core.telescope").setup()
        end,
    },
    -- Install nvim-cmp, and buffer source as a dependency
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("lvim.core.cmp").setup()
        end,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", },
            { "saadparwaiz1/cmp_luasnip", },
            { "hrsh7th/cmp-buffer", },
            { "hrsh7th/cmp-path", },
            { "hrsh7th/cmp-cmdline", },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            local utils = require "lvim.utils"
            local paths = {}
            if lvim.builtin.luasnip.sources.friendly_snippets then
                paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt",
                    "friendly-snippets")
            end
            local user_snippets = utils.join_paths(get_config_dir(), "snippets")
            if utils.is_directory(user_snippets) then
                paths[#paths + 1] = user_snippets
            end
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load {
                paths = paths,
            }
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        event = "InsertEnter",
        dependencies = {
            { "rafamadriz/friendly-snippets", },
        },
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("lvim.core.autopairs").setup()
        end,
        enabled = lvim.builtin.autopairs.active,
        dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        -- run = ":TSUpdate",
        config = function()
            -- local utils = require "lvim.utils"
            -- local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
            -- vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
            require("lvim.core.treesitter").setup()
        end,
        cmd = {
            "TSInstall",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSInstallInfo",
            "TSInstallSync",
            "TSInstallFromGrammar",
        },
        event = "User FileOpened",
    },

    -- NvimTree
    {
        "kyazdani42/nvim-tree.lua",
        event = "User DirOpened",
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
        config = function()
            require("lvim.core.nvimtree").setup()
        end,
    },
    -- Lir
    {
        "tamago324/lir.nvim",
        event = "User DirOpened",
        config = function()
            require("lvim.core.lir").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User FileOpened",
        cmd = "Gitsigns",
        config = function()
            require("lvim.core.gitsigns").setup()
        end,
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        cmd = "WhichKey",
        event = "VeryLazy",
        config = function()
            require("lvim.core.which-key").setup()
        end,
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        event = "User FileOpened",
        config = function()
            require("lvim.core.comment").setup()
        end,
        dependencies = {
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        }
    },

    -- project.nvim
    {
        "ahmedkhalf/project.nvim",
        event = "VimEnter",
        cmd = "Telescope projects",
        config = function()
            require("lvim.core.project").setup()
        end,
    },

    -- Icons
    { "nvim-tree/nvim-web-devicons", },

    -- Status Line and Bufferline
    {
        -- "hoob3rt/lualine.nvim",
        "nvim-lualine/lualine.nvim",
        -- "Lunarvim/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("lvim.core.lualine").setup()
        end,
    },

    -- breadcrumbs
    {
        "SmiteshP/nvim-navic",
        event = "User FileOpened",
        config = function()
            require("lvim.core.breadcrumbs").setup()
        end,
    },

    {
        "akinsho/bufferline.nvim",
        config = function()
            require("lvim.core.bufferline").setup()
        end,
        branch = "main",
        event = "User FileOpened",
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = { "rcarriga/nvim-dap-ui", },
        config = function()
            require("lvim.core.dap").setup()
        end,
    },

    -- Debugger user interface
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("lvim.core.dap").setup_ui()
        end,
    },

    -- alpha
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("lvim.core.alpha").setup()
        end,
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        init = function()
            require("lvim.core.terminal").init()
        end,
        config = function()
            require("lvim.core.terminal").setup()
        end,
        cmd = {
            "ToggleTerm",
            "TermExec",
            "ToggleTermToggleAll",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
        keys = lvim.builtin.terminal.open_mapping,
    },

    -- SchemaStore
    { "b0o/schemastore.nvim" },

    { "folke/neodev.nvim" },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("lvim.core.illuminate").setup()
        end,
        event = "User FileOpened",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("lvim.core.indentlines").setup()
        end,
        event = "User FileOpened",
    },

    {
        "lunarvim/bigfile.nvim",
        config = function()
            pcall(function()
                require("bigfile").setup()
            end)
        end,
        event = { "FileReadPre", "BufReadPre", "User FileOpened" },
    },
}
