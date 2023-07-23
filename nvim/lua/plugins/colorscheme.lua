return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		-- "rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true,
			-- [[ tokyonight ]] --
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			style = "moon",

			-- [[ kanagawa ]] --
			-- ---@type "wave"|"lotus"|"dragon"
			-- theme = "dragon",
		},
		init = function()
			vim.cmd([[colorscheme tokyonight]])
			-- vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
