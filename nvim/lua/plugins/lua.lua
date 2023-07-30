return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"lua",
			})
		end,
	},
	-- "solargraph",
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					-- keys = {},
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							completion = { callSnippet = "Replace" },
							telemetry = { enable = false },
						},
					},
				},
			},
		},
	},
}
