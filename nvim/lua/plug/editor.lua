local Keys = require("core.keys")
return {
    { "folke/lazy.nvim", tag = "stable" },

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                -- floats = "transparent",
            },
            style = "moon",
        },
        init = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
        enabled = true,
    },


    -- FileTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        event = "User DirOpened",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = require("conf.neotree"),
        keys = Keys.get_module("neotree"),
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Gitsigns",
        config = function()
            require("conf.gitsigns")
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

    -- -- project.nvim
    -- {
    --     "ahmedkhalf/project.nvim",
    --     event = "VimEnter",
    --     cmd = "Telescope projects",
    --     config = function() require("conf.project").setup() end,
    -- },

    -- Lir
    -- {
    --     "tamago324/lir.nvim",
    --     event = "User DirOpened",
    --     config = function()
    --         require("lvim.core.lir").setup()
    --     end,
    -- },
    -- { "Tastyep/structlog.nvim", },

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
        opts = require("conf.indent-blankline"),
        main = "ibl",
    },

    {
        "lunarvim/bigfile.nvim",
        event = { "FileReadPre", "BufReadPre", "User FileOpened" },
        opts = {},
    },

    {
        "NvChad/nvterm",
        opts = {},
        keys = Keys.get_module("terminal"),
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
        },
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        opts = {},
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
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
    -- Autopairs
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         require("lvim.core.autopairs").setup()
    --     end,
    --     dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    -- },

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
                desc = "Don't Save Current Session"
            },
        },
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = { { "<leader>gu", ":UndotreeToggle", desc = "To[G]gle [U]ndotree" } },
    },

    -- { "stevearc/oil.nvim",   lazy = false },
    {
        "folke/zen-mode.nvim",
        dependencies = "folke/twilight.nvim",
        cmd = "ZenMode",
        opts = {
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = true }, -- disables git signs
            },
        },
        keys = {
            {
                "<leader>uz",
                function()
                    require("zen-mode").toggle()
                end,
                desc = "Toggle [Z]en Mode",
            },
        },
    },

    {
        "NoahTheDuke/vim-just",
        lazy = false
        -- event = "BufRead",
    },
}
