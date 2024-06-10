-- local Keys = require("core.keys")
return {
    -- Finds and lists all of the TODO, HACK, BUG, etc comment
    -- in your project and loads them into a browsable list.
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        -- keys = Keys.get_module("todocomments"),
    },

    -- 'theprimeagen/vim-be-good',
    {
        "theprimeagen/harpoon",
        opts = {},
        -- keys = Keys.get_module("harpoon"),
    },

    -- better diagnostics list and others
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        -- keys = Keys.get_module("trouble"),
    },

    -- { "mg979/vim-visual-multi" },
    -- { 'LionC/nest.nvim' }

    -- {
    --     "github/copilot.vim",
    --     lazy = false,
    -- },

    -- Flash enhances the built-in search functionality by showing labels
    -- at the end of each match, letting you quickly jump to a specific
    -- location.
    {
        "folke/flash.nvim",
        opts = {},
        keys = {
            {
                "s",
                function()
                    require("flash").jump()
                end,
                mode = { "n", "x", "o" },
                desc = "Flash [S]earch",
            },
            {
                "S",
                function()
                    require("flash").treesitter()
                end,
                mode = { "n", "o", "x" },
                desc = "Flash Treesitter [S]earch",
            },
        },
    },
}
