local Keys = require("core.keys")

return {
	-- Telescope
	-- {
	--     "nvim-telescope/telescope.nvim",
	--     branch = "0.1.x",
	--     cmd = "Telescope",
	--     dependencies = {
	--         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	--         "nvim-lua/plenary.nvim"
	--     },
	--     config = function() require("conf.telescope") end,
	-- },

	-- Flash enhances the built-in search functionality by showing labels
	-- at the end of each match, letting you quickly jump to a specific
	-- location.
	{
		"folke/flash.nvim",
		opts = {},
		keys = Keys.get_module("flash"),
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		init = function()
			require("core.keys").load_module("telescope")
		end,
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
					n = {
						["q"] = function()
							require("telescope.actions").close()
						end,
					},
				},
			},
			extensions_list = { "fzf" },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	-- Flash Telescope config
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local function flash(prompt_bufnr)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
							end,
						},
					},
					action = function(match)
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end,
				})
			end
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
			})
		end,
	},

	{
		"telescope.nvim",
		dependencies = {
			-- project management
			{
				"ahmedkhalf/project.nvim",
				opts = {},
				event = "VeryLazy",
				config = function(_, opts)
					require("project_nvim").setup(opts)
					require("telescope").load_extension("projects")
				end,
				keys = {
					{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
				},
			},
		},
	},
}
