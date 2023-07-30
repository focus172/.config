if true then
    return {}
end

return {
	"epwalsh/obsidian.nvim",
	event = { "BufReadPre " .. vim.fn.expand("$XDG_DOCUMENTS_DIR") .. "/dnd/**.md" },
	init = function()
		vim.keymap.set("n", "gf", "<cmd>ObsidianFollowLink<CR>", { noremap = false, expr = true })
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = vim.fn.expand("$XDG_DOCUMENTS_DIR") .. "/dnd", -- no need to call 'vim.fn.expand' here
	},
}
