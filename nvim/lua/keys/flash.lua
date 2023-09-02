return {
	{
		"s",
		function()
			require("flash").jump()
		end,
		mode = { "n", "x", "o" },
		desc = "Flash [S]earch",
	},
	{
		"S",
		function()
			require("flash").treesitter()
		end,
		mode = { "n", "o", "x" },
		desc = "Flash Treesitter [S]earch",
	},
	{
		"R",
		function()
			require("flash").treesitter_search()
		end,
		mode = { "o", "x" },
		desc = "Treesitte[R] Search",
	},
	{
		"r",
		function()
			require("flash").remote()
		end,
		mode = "o",
		desc = "[R]emote Flash",
	},
	{
		"<c-s>",
		function()
			require("flash").toggle()
		end,
		mode = "c",
		desc = "Toggle Flash [S]earch",
	},
}
