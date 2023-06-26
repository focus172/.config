local plugins = {
    -- Overriding plugins --
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                "rust-analyzer", "lua-language-server", "pyright", "mypy",
                "ruff", "shellcheck" -- "zls", "gopls"
            }
        }
    }, {
        'neovim/nvim-lspconfig',
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.conf.lspconfig"
        end
    }, {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require("plugins.configs.cmp")
            table.insert(M.sources, {name = "crates"})
            return M
        end
    }, {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "plugins.configs.cmp"
            M.mapping["<S-Tab>"] = M.mapping["<Tab>"]
            M.mapping["<Tab>"] = nil
            return M
        end
    }, {
        'simrat39/rust-tools.nvim',
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function() return require("custom.conf.rusttools") end
    }, {'mfussenegger/nvim-dap'}, {
        'saecki/crates.nvim',
        dependencies = "hrsh7th/nvim-cmp",
        ft = {'rust', 'toml'},
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end
    }, {"christoomey/vim-tmux-navigator", lazy = false},
    {'github/copilot.vim', event = "InsertEnter"},
    {'theprimeagen/harpoon', cmd = 'HarpoonAddTerm'},
    {"mbbill/undotree", cmd = "UndotreeToggle"}, {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function() return require("custom.conf.nullls") end,
        dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
        event = "BufRead"
    }, {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        after = "null-ls"
    }, {'stevearc/oil.nvim', lazy = false},
    {'nvim-treesitter/nvim-treesitter-context'},
    -- "theprimeagen/refactoring.nvim",
    -- "tpope/vim-fugitive",
    -- "nvim-treesitter/playground",
    -- "folke/zen-mode.nvim",
    -- "folke/twilight.nvim",
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function() require("todo-comments").setup() end
    }, 
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    -- }, 
    {
        "nvim-neorg/neorg",
        event = "BufRead",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("neorg").setup {
            load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                  workspaces = {
                    notes = "~/cur",
                  },
                },
              },
            },
          }
        end,
    },
}

return plugins
