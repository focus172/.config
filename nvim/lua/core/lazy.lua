require("lazy").setup({
	spec = {
		-- this needs to always be loaded fist so other things can extend it
		{ import = "plugins" },

		-- { import = "extras.coding.copilot" },
		-- { import = "extras.ui.mini-animate" },
	},
	defaults = {
		lazy = false, -- TODO: Change this to true once configuration is done
		version = false,
	},
	-- install = { colorscheme = { "tokyonight" } },
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
