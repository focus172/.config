return function()
	local opts = {
		-- operates on current line
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		-- accepts any vim motion as selection operator
		opleader = {
			line = "gc",
			block = "gb",
		},
		-- extra = {
		--     above = false,
		--     below = false,
		--     eol = false,
		-- },
		mappings = {
			basic = true,
			extra = false,
		},
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	}
	require("Comment").setup(opts)
end
