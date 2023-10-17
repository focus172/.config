return {
	n = {
		-- find
		["<leader><space>"] = { "<cmd> Telescope buffers <CR>", "[F]ind [ ] buffers" },
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "[F]ind [F]iles" },
		-- ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "[F]ind [A]ll" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "[F]ind [W]ord" },
		-- ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "[F]ind [S]tring" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "[F]ind [H]elp" },
		-- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "[F]ind [O]ldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[F]u[Z]zy Find" },
		["<leader>fg"] = { "<cmd> Telescope git_status <CR>", "[F]ind Active [G]it" },
		-- ["<leader>fG"] = { "<cmd> Telescope git_files <CR>", "[F]ind All [G]it" },
		["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "[F]ind Git [C]ommits" },
-- 	{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
		["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "[F]ind [D]iagnostics" },
		["<leader>fm"] = { "<cmd> Telescope marks <CR>", "[F]ind [M]arks" },
        ["<leader>f:"] = { "<cmd> Telescope command_history <cr>", "[F]ind [:] Command" },

		-- ["<leader>uC"] = { "<cmd> Telescope colorscheme enable_preview=true", "Colorscheme" }
	},
}

-- return {
-- 	{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
-- 	{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
-- 	{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
-- 	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
-- 	{ "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
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
--
--         local telescope_builtin = require('telescope.builtin')
--         vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = "[P]roject [F]ile search" })
--         vim.keymap.set('n', '<leader>pg', telescope_builtin.git_files, { desc = "[P]roject [G]it file search" })
--         vim.keymap.set('n', '<leader>ps', telescope_builtin.live_grep, { desc = "[P]roject [S]earch with grep" })
--         vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
--         -- vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
--         -- vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
--         -- vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
--         vim.keymap.set('n', '<leader>/', function()
--             -- You can pass additional configuration to telescope to change theme, layout, etc.
--             telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--                 winblend = 10,
--                 previewer = false,
--             })
--         end, { desc = '[/] Search in current buffer' })