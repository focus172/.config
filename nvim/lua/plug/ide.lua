local Keys = require("core.keys")
return {
	-- Finds and lists all of the TODO, HACK, BUG, etc comment
	-- in your project and loads them into a browsable list.
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		keys = Keys.get_module("todocomments"),
	},

	-- 'theprimeagen/vim-be-good',
	{
		"theprimeagen/harpoon",
		opts = {},
		keys = Keys.get_module("harpoon"),
	},

	-- search/replace in multiple files
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = Keys.get_module("spectre"),
	},

	-- Automatically highlights other instances of the word under your cursor.
	-- This works with LSP, Treesitter, and regexp matching to find the other
	-- instances.
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("conf.illuminate"),
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = Keys.get_module("trouble"),
	},

	-- {
	-- 	"mg979/vim-visual-multi",
	-- 	enabled = false,
	-- },

    -- { 'LionC/nest.nvim' }
}
