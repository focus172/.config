return {
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show() -- should not be nessisary but is
        end,
    },

    {
        "simrat39/rust-tools.nvim",
        -- event = "BufReadPre rust",
        ft = "rust",
        opts = {},
    },

    -- TODO: add lang opts here
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                rust_analyzer = {
                    -- settings = {
                    --     ["rust-analyzer"] = {
                    --         cargo = {
                    --             allFeatures = true,
                    --             loadOutDirsFromCheck = true,
                    --             runBuildScripts = true,
                    --         },
                    --         -- Add clippy lints for Rust.
                    --         checkOnSave = {
                    --             allFeatures = true,
                    --             command = "clippy",
                    --             extraArgs = { "--no-deps" },
                    --         },
                    --         procMacro = {
                    --             enable = true,
                    --             ignored = {
                    --                 ["async-trait"] = { "async_trait" },
                    --                 ["napi-derive"] = { "napi" },
                    --                 ["async-recursion"] = { "async_recursion" },
                    --             },
                    --         },
                    --         init_options = { num_threads = 4 },
                    --     },
                    -- },
                },
                taplo = {},
            },
        },
    },
}
