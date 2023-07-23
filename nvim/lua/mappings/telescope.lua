return {
	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader><space>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[F]ind [O]ldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
		["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Search [G]it [F]iles" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

		-- pick a hidden term
		-- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

		-- theme switcher
		["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

		-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
		-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
		-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
		["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "[F]ind [D]iagnostics" },
	},
}

-- return {
-- 	{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
-- 	{ "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
-- 	{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
-- 	{ "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
-- 	-- find
-- 	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
-- 	{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
-- 	{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
-- 	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
-- 	{ "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
-- 	-- git
-- 	{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
-- 	{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
-- 	-- search
-- 	{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
-- 	{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
-- 	{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
-- 	{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
-- 	{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
-- 	{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
-- 	{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
-- 	{ "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
-- 	{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
-- 	{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
-- 	{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
-- 	{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
-- 	{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
-- 	{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
-- 	{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
-- 	{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
-- 	{ "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
-- 	{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
-- 	{
-- 		"<leader>uC",
-- 		Util.telescope("colorscheme", { enable_preview = true }),
-- 		desc = "Colorscheme with preview",
-- 	},
-- 	{
-- 		"<leader>ss",
-- 		Util.telescope("lsp_document_symbols", {
-- 			symbols = {
-- 				"Class",
-- 				"Function",
-- 				"Method",
-- 				"Constructor",
-- 				"Interface",
-- 				"Module",
-- 				"Struct",
-- 				"Trait",
-- 				"Field",
-- 				"Property",
-- 			},
-- 		}),
-- 		desc = "Goto Symbol",
-- 	},
-- 	{
-- 		"<leader>sS",
-- 		Util.telescope("lsp_dynamic_workspace_symbols", {
-- 			symbols = {
-- 				"Class",
-- 				"Function",
-- 				"Method",
-- 				"Constructor",
-- 				"Interface",
-- 				"Module",
-- 				"Struct",
-- 				"Trait",
-- 				"Field",
-- 				"Property",
-- 			},
-- 		}),
-- 		desc = "Goto Symbol (Workspace)",
-- 	},
-- },
