local Keys = require("core.keys")
return {
    { "folke/lazy.nvim",     tag = "stable" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        -- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        cmd = {
            "TSInstall",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSInstallInfo",
            "TSInstallSync",
            "TSInstallFromGrammar",
        },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" },
        },
        config = function()
            require("conf.treesitter")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- alpha
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("conf.alpha")
        end,
    },
    -- { "Tastyep/structlog.nvim", },

    -- FileTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        event = "User DirOpened",
        init = function()
            require("core.keys").load_module("neotree")
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function()
            require("conf.neotree")
        end,
    },

    -- Autopairs
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         require("lvim.core.autopairs").setup()
    --     end,
    --     dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    -- },

    -- Lir
    -- {
    --     "tamago324/lir.nvim",
    --     event = "User DirOpened",
    --     config = function()
    --         require("lvim.core.lir").setup()
    --     end,
    -- },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Gitsigns",
        config = function()
            require("conf.gitsigns")
        end,
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        cmd = "WhichKey",
        event = "VeryLazy",
        config = function()
            require("conf.whichkey")
        end,
    },
    -- Comments
    {
        "numToStr/Comment.nvim",
        -- lazy = false,
        keys = Keys.get_module("comment"),
        event = "User FileOpened",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = require("conf.comment"),
    },

    -- project.nvim
    -- {
    --     "ahmedkhalf/project.nvim",
    --     event = "VimEnter",
    --     cmd = "Telescope projects",
    --     config = function() require("conf.project").setup() end,
    -- },

    {
        "nvim-lualine/lualine.nvim",
        -- "hoob3rt/lualine.nvim",
        -- "Lunarvim/lualine.nvim",
        event = "VimEnter",
		-- event = "VeryLazy",
        config = function()
            require("conf.lualine")
        end,
    },

    -- breadcrumbs
    -- {
    --     "SmiteshP/nvim-navic",
    --     event = "User FileOpened",
    --     config = function()
    --         require("lvim.core.breadcrumbs").setup()
    --     end,
    -- },

    {
        "akinsho/bufferline.nvim",
        branch = "main",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("conf.bufferline")
        end,
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        },
    },

    -- SchemaStore
    -- { "b0o/schemastore.nvim" },

    -- {
    --     "RRethy/vim-illuminate",
    --     config = function()
    --         require("lvim.core.illuminate").setup()
    --     end,
    --     event = "User FileOpened",
    -- },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("conf.indentlines")
        end,
    },

    -- {
    --     "lunarvim/bigfile.nvim",
    --     event = { "FileReadPre", "BufReadPre", "User FileOpened" },
    --     opts = {},
    -- },

    {
        "NvChad/nvterm",
        opts = {},
        keys = Keys.get_module("terminal"),
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        -- stylua: ignore
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
        },
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        lazy = false,
        opts = {},
        -- init = function()
        -- 	---@diagnostic disable-next-line: duplicate-set-field
        -- 	vim.ui.select = function(...)
        -- 		require("lazy").load({ plugins = { "dressing.nvim" } })
        -- 		return vim.ui.select(...)
        -- 	end
        -- 	---@diagnostic disable-next-line: duplicate-set-field
        -- 	vim.ui.input = function(...)
        -- 		require("lazy").load({ plugins = { "dressing.nvim" } })
        -- 		return vim.ui.input(...)
        -- 	end
        -- end,
    },

    -- auto pairs
    {
        "echasnovski/mini.pairs",
        event = "BufRead",
        opts = {},
    },
    {
        "m4xshen/autoclose.nvim", -- auto close brackets
        event = "BufRead",
        opts = {},
    },

    -- Fast and feature-rich surround actions. For text that includes
    -- surrounding characters like brackets or quotes, this allows you
    -- to select the text inside, change or modify the surrounding characters,
    -- and more.
    {
        "echasnovski/mini.surround",
        keys = {
            { "gza", desc = "[A]dd surrounding",                   mode = { "n", "v" } },
            { "gzd", desc = "[D]elete surrounding" },
            { "gzf", desc = "[F]ind right surrounding" },
            { "gzF", desc = "[F]ind left surrounding" },
            { "gzh", desc = "[H]ighlight surrounding" },
            { "gzr", desc = "[R]eplace surrounding" },
            { "gzn", desc = "Update `MiniSurround.config.n_lines`" },
        },
        opts = {
            mappings = {
                add = "gza", -- Add surrounding in Normal and Visual modes
                delete = "gzd", -- Delete surrounding
                find = "gzf", -- Find surrounding (to the right)
                find_left = "gzF", -- Find surrounding (to the left)
                highlight = "gzh", -- Highlight surrounding
                replace = "gzr", -- Replace surrounding
                update_n_lines = "gzn", -- Update `n_lines`
            },
        },
    },

    -- Session management. This saves your session in the background,
    -- keeping track of open buffers, window arrangement, and more.
    -- You can restore sessions when returning through the dashboard.
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            {
                "<leader>qd",
                function() require("persistence").stop() end,
                desc =
                "Don't Save Current Session"
            },
        },
    },
    -- { "christoomey/vim-tmux-navigator", lazy = false },
    { "mbbill/undotree",     cmd = "UndotreeToggle" },
    { "stevearc/oil.nvim",   lazy = false },
    { "folke/zen-mode.nvim", dependencies = "folke/twilight.nvim" },
}
