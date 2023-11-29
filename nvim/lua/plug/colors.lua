return {
	-- rosepine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
		opts = { disable_background = true },
		enabled = false,
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			style = "moon",
		},
		init = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
		enabled = true,
	},

	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true,
			---@type "wave"|"lotus"|"dragon"
			theme = "dragon",
		},
		init = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
		enabled = false,
	},
}
