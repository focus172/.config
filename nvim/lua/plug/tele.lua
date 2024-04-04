return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    -- init = function() require("core.keys").load_module("telescope") end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ahmedkhalf/project.nvim",
        -- {
        --     "nvim-telescope/telescope-fzf-native.nvim",
        --     build = "make",
        -- },
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
                n = {
                    ["q"] = function()
                        require("telescope.actions").close(1)
                    end,
                },
            },
        },
        extensions_list = {
            -- "fzf"
        },
    },
    config = function(_, opts)
        -- require("conf.telescope")

        local telescope = require("telescope")
        telescope.setup(opts)

        -- load extensions
        for _, ext in ipairs(opts.extensions_list) do
            telescope.load_extension(ext)
        end
    end,
}
