require("lazy").setup({
	spec = {
        -- these need to be sourced first so they can be extended
        { import = "plugins.core" },

        -- sources all the files for ide type things
        { import = "plugins.editor" },

        -- add lsp config for langs
        { import = "plugins.langs" }
    },
	defaults = { lazy = true },
	-- install = { colorscheme = { "tokyonight" } },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
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
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"logipat",
				"netrw",
				"netrwSettings",
				"netrwFileHandlers",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
				"editorconfig",
			},
		},
	},
})
