return {
    -- Add Rust & related to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "haskell" })
        end,
    },

    -- Correctly setup lspconfig for Rust
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                hls = {},
            },
        },
    },
}
