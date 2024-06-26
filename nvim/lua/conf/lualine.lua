-- local icons = require("icons")

local opts = {
	options = {
		theme = "auto",
		globalstatus = true,
		disabled_filetypes = { statusline = { "dashboard", "alpha" } },
		-- disabled_filetypes = { 'neo-tree', }
		-- icons_enabled = true,
		-- component_separators = '|',
		-- section_separators = '',
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"diagnostics",
				symbols = {
					-- error = icons.diagnostics.Error,
					-- warn = icons.diagnostics.Warn,
					-- info = icons.diagnostics.Info,
					-- hint = icons.diagnostics.Hint,
				},
			},
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
                function() return require("nvim-navic").get_location() end,
                cond = function()
                    return package.loaded["nvim-navic"] and
                        require("nvim-navic").is_available()
                end,
            },
		},
		lualine_x = {
			-- {
			-- 	function()
			-- 		return require("noice").api.status.command.get()
			-- 	end,
			-- 	cond = function()
			-- 		return package.loaded["noice"] and require("noice").api.status.command.has()
			-- 	end,
			-- 	-- color = Util.fg("Statement"),
			-- },
			-- {
			-- 	function()
			-- 		return require("noice").api.status.mode.get()
			-- 	end,
			-- 	cond = function()
			-- 		return package.loaded["noice"] and require("noice").api.status.mode.has()
			-- 	end,
			-- 	-- color = Util.fg("Constant"),
			-- },
			{
				"diff",
				symbols = {
					-- added = icons.git.added,
					-- modified = icons.git.modified,
					-- removed = icons.git.removed,
				},
			},
            -- {
            --     function()
            --         local icon = require("icons").misc.Robot
            --         local status = require("copilot.api").status.data
            --         return icon .. (status.message or "")
            --     end,
            --     cond = function()
            --         local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
            --         return ok and #clients > 0
            --     end,
            --     color = function()
            --         if not package.loaded["copilot"] then return end
            --         local status = require("copilot.api").status.data
            --         return colors[status.status] or colors[""]
            --     end,
            -- }
		},
		lualine_y = {
			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
	extensions = { "neo-tree", "lazy" },
}

require("lualine").setup(opts)
