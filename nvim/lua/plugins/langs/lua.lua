return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "lua",
            })
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.sources, require("null-ls").builtins.formatting.stylua)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            completion = { callSnippet = "Replace" },
                            telemetry = { enable = false },
                        },
                    },
                },
            },
        },
    },
}
