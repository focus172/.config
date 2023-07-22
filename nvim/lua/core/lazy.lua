require("lazy").setup({
	spec = {
		-- { import = "extras.lang.typescript" },
		{ import = "extras.lang.rust" },
		-- { import = "extras.ui.mini-animate" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = false, -- TODO: Change this to true once configuration is done
		version = false,
	},
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
