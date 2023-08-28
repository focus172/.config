-- return {
--     'nvim-telescope/telescope.nvim',
--     config = function()
--         require('telescope').setup {
--             defaults = {
--                 mappings = {
--                     i = {
--                         ['<C-u>'] = false,
--                         ['<C-d>'] = false,
--                     },
--                 },
--             },
--         }
--
--         -- See `:help telescope.builtin`
--         local telescope_builtin = require('telescope.builtin')
--         vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = "[P]roject [F]ile search" })
--         vim.keymap.set('n', '<leader>pg', telescope_builtin.git_files, { desc = "[P]roject [G]it file search" })
--         vim.keymap.set('n', '<leader>ps', telescope_builtin.live_grep, { desc = "[P]roject [S]earch with grep" })
--         vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
--         -- vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
--         -- vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
--         -- vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
--         vim.keymap.set('n', '<leader>/', function()
--             -- You can pass additional configuration to telescope to change theme, layout, etc.
--             telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--                 winblend = 10,
--                 previewer = false,
--             })
--         end, { desc = '[/] Search in current buffer' })
--     end
-- }

-- fuzzy finder
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        -- load when needed or at end of startup
        cmd = "Telescope",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        opts = {
            defaults = {
                -- prompt_prefix = " ",
                prompt_prefix = "   ",
                selection_caret = " ",
                -- entry_prefix = "  ",
                initial_mode = "insert",
                file_ignore_patterns = { "node_modules", "target" },
                set_env = { ["COLORTERM"] = "truecolor" },
                -- these mappings apply when in a telescope buffer
                mappings = {
                    i = {
                        ["<c-t>"] = function(...)
                            return require("trouble.providers.telescope").open_with_trouble(...)
                        end,
                        ["<a-t>"] = function(...)
                            return require("trouble.providers.telescope").open_selected_with_trouble(...)
                        end,
                        -- ["<a-i>"] = function()
                        -- 	local action_state = require("telescope.actions.state")
                        -- 	local line = action_state.get_current_line()
                        -- 	Util.telescope("find_files", { no_ignore = true, default_text = line })()
                        -- end,
                        -- ["<a-h>"] = function()
                        -- 	local action_state = require("telescope.actions.state")
                        -- 	local line = action_state.get_current_line()
                        -- 	Util.telescope("find_files", { hidden = true, default_text = line })()
                        -- end,
                        ["<C-Down>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-Up>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                    n = { ["q"] = require("telescope.actions").close },
                },
            },
            extensions_list = { "fzf" },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)

            require("core.keys").load_module("telescope")

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end
        end,
    },

}
