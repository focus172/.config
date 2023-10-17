return {
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
	},
	{
	    "nvim-orgmode/orgmode",
	    event = "VeryLazy",
	    config = function()
	        -- Load treesitter grammar for org
	        require("orgmode").setup_ts_grammar()

	        -- Setup orgmode
	        require("orgmode").setup({
	            org_agenda_files = "~/dox/notes/**/*",
	            org_default_notes_file = "~/dox/notes/index.org",
	        })
	    end,
	},
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	event = "VeryLazy",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	opts = {
	-- 		load = {
	-- 			["core.defaults"] = {}, -- Loads default behaviour
	-- 			["core.concealer"] = {}, -- Adds pretty icons to your documents
	-- 			["core.dirman"] = { -- Manages Neorg workspaces
	-- 				config = {
	-- 					workspaces = {
	-- 						notes = "~/dox/notes",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"alaviss/nim.nvim",
		ft = "nim",
	},
}
