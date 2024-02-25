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
        event = "BufReadPre rust",
        ft = "rust",
        opts = {
            tools = {
                on_initialized = function()
                    vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { desc = "Hover Actions (Rust)" })
                    vim.keymap.set("n", "<leader>ca", "<cmd>RustCodeAction<cr>", { desc = "Code Actions (Rust)" })
                    vim.keymap.set("n", "<leader>dr", "<cmd>RustDebuggables<cr>", { desc = "Run Debuggables (Rust)" })

                    vim.cmd([[
                        augroup RustLSP
                            autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                            autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                            autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                        augroup END
                        ]])
                end,
            },
        },
    },

    -- TODO: add lang opts here
    -- {
    --     "neovim/nvim-lspconfig",
    --     opts = {}
    -- },
}
