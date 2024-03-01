return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" },
        },
        main = "nvim-treesitter.configs",
        opts = {
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "org" },
                -- use_languagetree = true,
            },
            indent = { enable = true },
            ensure_installed = {
                "html",
                "markdown",
                "markdown_inline",
                "lua",
                "rust",
                "toml",
                "ron",
                "zig",
                "haskell",
                "c",
                "cpp",
                "go",
                "python",
                "typescript",
                "vim",
                "org",
                -- 'ocaml'
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sa"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>sA"] = "@parameter.inner",
                    }
                }
            }
        }
    },

    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {},
    -- }
}
