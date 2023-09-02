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
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
            { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
        },
	},

	-- 'theprimeagen/vim-be-good',
	{
		"theprimeagen/harpoon",
		opts = {},
		keys = Keys.get_module("harpoon"),
	},

	{
		"mrjones2014/legendary.nvim",
		cmd = "Legendary",
		dependencies = { "stevearc/dressing.nvim", "kkharji/sqlite.lua" },
		opts = { lazy_nvim = { auto_register = true }, which_key = { auto_register = true } },
		keys = { { "<C-p>", ":Legendary<CR>", desc = "Command [P]alette" } },
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
}
