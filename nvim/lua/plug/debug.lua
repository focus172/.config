return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"rouge8/neotest-rust",
		},
		opts = {
			adapters = {
				["neotest-rust"] = {},
			},
		},
	},

	-- Debugging
	-- {
	--     "mfussenegger/nvim-dap",
	--     dependencies = {
	--         -- Debugger user interface
	--         "rcarriga/nvim-dap-ui",
	--     },
	--     config = function()
	--         require("lvim.core.dap").setup()
	--     end,
	-- },

	-- {
	--     "rcarriga/nvim-dap-ui",
	--     config = function()
	--         require("lvim.core.dap").setup_ui()
	--     end,
	-- },
}
