local Util = require("core.util")

local telescope_opts = {
	defaults = {
		-- prompt_prefix = " ",
		prompt_prefix = "   ",
		selection_caret = " ",
		-- entry_prefix = "  ",
		initial_mode = "insert",
		file_ignore_patterns = { "node_modules", "target" },
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		-- these mappings apply when in a telescope buffer
		mappings = {
			i = {
				["<c-t>"] = function(...)
					return require("trouble.providers.telescope").open_with_trouble(...)
				end,
				["<a-t>"] = function(...)
					return require("trouble.providers.telescope").open_selected_with_trouble(...)
				end,
				["<a-i>"] = function()
					local action_state = require("telescope.actions.state")
					local line = action_state.get_current_line()
					Util.telescope("find_files", { no_ignore = true, default_text = line })()
				end,
				["<a-h>"] = function()
					local action_state = require("telescope.actions.state")
					local line = action_state.get_current_line()
					Util.telescope("find_files", { hidden = true, default_text = line })()
				end,
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
}

-- fuzzy finder
return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		init = function()
			require("core.util").load_mappings("telescope")
		end,
		opts = telescope_opts,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
		dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
	},

}
