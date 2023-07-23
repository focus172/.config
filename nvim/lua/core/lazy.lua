require("lazy").setup({
	spec = { { import = "plugins" } }, -- sources all files in the config dir
	defaults = {
		lazy = false, -- TODO: Change this to true once configuration is done
		version = false,
	},
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
