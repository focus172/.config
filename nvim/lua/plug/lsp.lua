return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
            { "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach", opts = {} },
            -- { "tamago324/nlsp-settings.nvim", cmd = "LspSettings", opts = {} },
        },
        config = function()
            require("conf.lspconf")
        end,
    },

    -- Install nvim-cmp, and buffer source as a dependency
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            -- snippets
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("conf.luasnip")
                end,
            },
        },
        config = function()
            require("conf.cmp")
        end,
    },
}
