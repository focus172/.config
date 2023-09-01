local options = {
	-- See `:help gitsigns.txt`
	signs = {
		-- add = { text = '+' },
		-- change = { text = '~' },
		-- delete = { text = '_' },
		-- topdelete = { text = '‾' },
		-- changedelete = { text = '~' },
		--
		--     add = { text = "│" },
		--     change = { text = "│" },
		--     delete = { text = "󰍵" },
		--     topdelete = { text = "‾" },
		--     changedelete = { text = "~" },
		--     untracked = { text = "│" },
	},
	on_attach = function(bufnr)
		vim.keymap.set(
			"n",
			"<leader>gp",
			require("gitsigns").prev_hunk,
			{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
		)
		vim.keymap.set(
			"n",
			"<leader>gn",
			require("gitsigns").next_hunk,
			{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
		)
		vim.keymap.set(
			"n",
			"<leader>ph",
			require("gitsigns").preview_hunk,
			{ buffer = bufnr, desc = "[P]review [H]unk" }
		)

		--     utils.load_mappings("gitsigns", { buffer = bufnr })
	end,
}

local opts = {
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},
	on_attach = function(buffer)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
		end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
	end,
}

require("gitsigns").setup(opts)
