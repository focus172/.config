if true then return {} end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "elixir",
            })
        end,
    },
    -- neeed to add elixir_ls to list of lsp
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "jfpedroza/neotest-elixir",
        },
        opts = {
            adapters = {
                ["neotest-elixir"] = {},
            },
        },
    },
}
