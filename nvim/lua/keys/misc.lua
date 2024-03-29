local M = {}

M.trouble = {
	i = { ["<C-t>"] = { "<cmd> TroubleToggle<CR>", "Toggle Trouble" } },
	n = {
		["<leader>tx"] = { "<cmd> TroubleToggle<CR>", "Toggle Trouble" },
		["<leader>tw"] = {
			"<cmd> TroubleToggle lsp_workspace_diagnostics<CR>",
			"Toggle Workspace Trouble",
		},
		["<leader>td"] = {
			"<cmd> TroubleToggle lsp_document_diagnostics<CR>",
			"Toggle Document Trouble",
		},
		["<leader>tl"] = {
			"<cmd> TroubleToggle loclist<CR>",
			"Toggle Loclist Trouble",
		},
		["<leader>tq"] = {
			"<cmd> TroubleToggle quickfix<CR>",
			"Toggle Quickfix Trouble",
		},
		-- ["<leader>gr"] = {"<cmd> TroubleToggle lsp_references<CR>", "Toggle References Trouble"},
	},
}

M.null_ls = {
	i = {
		["<C-t>"] = { "<cmd> lua vim.lsp.buf.format()<CR>", "Format" },
		["<C-space>"] = { "<cmd> lua vim.lsp.buf.hover()<CR>", "Hover" },
	},
	n = {
		["<leader>cf"] = { "<cmd> lua vim.lsp.buf.format()<CR>", "Format" },
		["<leader>rn"] = { "<cmd> lua vim.lsp.buf.rename()<CR>", "Rename" },
		["<leader>gi"] = {
			"<cmd> lua vim.lsp.buf.implementation()<CR>",
			"Go to Implementation",
		},
		["<leader>gr"] = {
			"<cmd> lua vim.lsp.buf.references()<CR>",
			"Go to References",
		},
		["<leader>sd"] = {
			"<cmd> lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
			"Show Line Diagnostics",
		},
		-- ["<leader>sr"] = {
		--     "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>",
		--     "Go to Previous Diagnostic"
		-- },
		-- ["<leader>sn"] = {
		--     "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>",
		--     "Go to Next Diagnostic"
		-- },
		-- ["<leader>sp"] = {
		--     "<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>", "Set Loclist"
		-- }
	},
}

M.rust_tools = {
	n = {
		["<leader>rr"] = { "<cmd> RustRunnables <CR>", "Run Rust Code" },
		["qK"] = { "<cmd> RustHoverActions <CR>", "Hover" },
		["<leader>rc"] = { "<cmd> RustOpenCargo <CR>", "Open Cargo Toml" },
		["<leader>rm"] = { "<cmd> RustExpandMacro <CR>", "Expand Macro" },
		["<leader>gm"] = { "<cmd> RustParentModule <CR>", "Go to rust parent module" },
	},
}

M.oil = {
	n = { ["-"] = { "<cmd>lua require('oil').open<CR>", "Open parent directory" } },
}

return M
