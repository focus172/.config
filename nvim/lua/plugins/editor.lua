return {
    {
        -- open a prompt for <leader> commands
        "folke/which-key.nvim",
        keys = { '<leader>', 'g' },
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
            require("which-key").setup({})
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {},
        event = "BufRead",
    },

    -- 'theprimeagen/vim-be-good',
    'theprimeagen/harpoon',

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
        end
    },

    'lukas-reineke/indent-blankline.nvim', -- add indentation guides even on blank lines

    {
        'm4xshen/autoclose.nvim',              -- auto close brackets
        event = "BufRead",
        opts = {}
    },

    -- Commenting with the push of -a- two buttons
    {
        'numToStr/Comment.nvim',
        keys = {
            {'<leader>cl', desc = "Toggles [C]omment for [L]ine"},
            {'<leader>cb', desc = "Toggles [C]omment [B]lock"},
        },

        opts = {
            -- operates on current line
            toggler = {
                line = '<leader>cl',
                block = 'leader>cb',
            },
            -- accepts any vim motion as selection operator
            opleader = {
                line = 'gc',
                block = 'gcb',
            },
            -- extra = {
            --     above = false,
            --     below = false,
            --     eol = false,
            -- },
            mappings = {
                basic = true,
                extra = false,
            },
        },
    },

    {
        'mrjones2014/legendary.nvim',
        dependencies = {
            'stevearc/dressing.nvim', -- dressing UI for legendary
            -- sqlite is only needed if you want to use frecency sorting
            'kkharji/sqlite.lua',
        },
        config = function()
            require('legendary').setup({
                keymaps = {
                    {
                        '<C-p>',
                        { n = ':Legendary<CR>' },
                        description = 'Command [P]alette',
                    },
                },
            })
        end
    },

    -- 'ocaml/vim-ocaml',
    -- 'mg979/vim-visual-multi',
}
