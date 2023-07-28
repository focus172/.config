return {
	-- tokyonight
	--    {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},
	-- 		style = "moon",
	-- 	},
	-- 	init = function()
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },

    -- rosepine
    {
        'rose-pine/neovim',
        name = 'rose-pine',
		lazy = true,
		priority = 1000,
		opts = {
            disable_background = true,
		},
		init = function()
			vim.cmd([[colorscheme rose-pine]])
	        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
    },

    -- kanagawa
		--   {
		-- "rebelot/kanagawa.nvim",
		-- lazy = true,
		-- priority = 1000,
		--       opts = {
		-- 	transparent = true,
		-- 	---@type "wave"|"lotus"|"dragon"
		-- 	theme = "dragon",
		--       },
		-- init = function()
		-- 	vim.cmd([[colorscheme kanagawa]])
		-- end,
		--   }
}
