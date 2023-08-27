return {
    -- Extend auto completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "Saecki/crates.nvim",
                event = { "BufRead Cargo.toml" },
                config = function(_, opts)
                    local crates = require("crates")
                    crates.setup(opts)
                    crates.show()
                end,
            },
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
                { name = "crates" },
            }))
        end,
    },

    -- Add Rust & related to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
        end,
    },

    {
        "simrat39/rust-tools.nvim",
        event = "BufReadPre rust",
        ft = "rust",
        opts = function()
            -- local codelldb_path = "/usr/bin/rust-lldb"
            -- local adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
            return {
                -- dap = {
                -- 	adapter = adapter,
                -- },
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
            }
        end,
    },

    -- Correctly setup lspconfig for Rust
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            -- Add clippy lints for Rust.
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
                taplo = {
                    keys = {
                        {
                            "K",
                            function()
                                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                                    require("crates").show_popup()
                                else
                                    vim.lsp.buf.hover()
                                end
                            end,
                            desc = "Show Crate Documentation",
                        },
                    },
                },
            },

        },
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "rouge8/neotest-rust",
        },
        opts = {
            adapters = {
                ["neotest-rust"] = {},
            },
        },
    },
}
