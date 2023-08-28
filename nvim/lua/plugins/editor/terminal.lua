return {
	"NvChad/nvterm",
	lazy = false,
	init = function()
		require("core.keys").load_module("terminal", {})
	end,
	opts = {},
}
