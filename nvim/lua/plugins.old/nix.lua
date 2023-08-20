return {
    -- Add Rust & related to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "nix" })
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = {
                -- nls.builtins.diagnostics.alejandra,
                nls.builtins.code_actions.statix
            }
        end,
    },
}
