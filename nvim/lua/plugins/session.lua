return {
	-- Session management. This saves your session in the background,
	-- keeping track of open buffers, window arrangement, and more.
	-- You can restore sessions when returning through the dashboard.
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
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

	-- {
	-- 	"goolord/alpha-nvim",
	-- 	optional = true,
	-- 	opts = function(_, dashboard)
	-- 		local button = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
	-- 		button.opts.hl = "AlphaButtons"
	-- 		button.opts.hl_shortcut = "AlphaShortcut"
	-- 		table.insert(dashboard.section.buttons.val, 4, button)
	-- 	end,
	-- },
}
