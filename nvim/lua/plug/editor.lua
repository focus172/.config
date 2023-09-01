return {
	{ "folke/lazy.nvim", tag = "stable" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		config = function()
			require("conf.treesitter")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	-- alpha
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("conf.alpha")
		end,
	},
	-- { "Tastyep/structlog.nvim", },

	-- Telescope
	-- {
	--     "nvim-telescope/telescope.nvim",
	--     branch = "0.1.x",
	--     cmd = "Telescope",
	--     dependencies = {
	--         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	--         "nvim-lua/plenary.nvim"
	--     },
	--     config = function() require("conf.telescope") end,
	-- },

	-- FileTree
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		event = "User DirOpened",
		init = function()
			require("core.keys").load_module("neotree")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			require("conf.neotree")
		end,
	},

	-- Autopairs
	-- {
	--     "windwp/nvim-autopairs",
	--     event = "InsertEnter",
	--     config = function()
	--         require("lvim.core.autopairs").setup()
	--     end,
	--     dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
	-- },

	-- Lir
	-- {
	--     "tamago324/lir.nvim",
	--     event = "User DirOpened",
	--     config = function()
	--         require("lvim.core.lir").setup()
	--     end,
	-- },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "Gitsigns",
		config = function()
			require("conf.gitsigns")
		end,
	},

	-- Whichkey
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		event = "VeryLazy",
		-- config = function() require("conf.whichkey") end,
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 200
			require("which-key").setup({})
		end,
	},
	-- Comments
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gc", mode = { "n", "v" }, desc = "Toggles Line [C]omment " },
			{ "gb", mode = { "n", "v" }, desc = "Toggles [B]lock Comment" },
		},
		event = "User FileOpened",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("conf.comment")
		end,
	},

	-- project.nvim
	-- {
	--     "ahmedkhalf/project.nvim",
	--     event = "VimEnter",
	--     cmd = "Telescope projects",
	--     config = function() require("conf.project").setup() end,
	-- },

	{
		"nvim-lualine/lualine.nvim",
		-- "hoob3rt/lualine.nvim",
		-- "Lunarvim/lualine.nvim",
		event = "VimEnter",
		config = function()
			require("conf.lualine")
		end,
	},

	-- breadcrumbs
	-- {
	--     "SmiteshP/nvim-navic",
	--     event = "User FileOpened",
	--     config = function()
	--         require("lvim.core.breadcrumbs").setup()
	--     end,
	-- },

	{
		"akinsho/bufferline.nvim",
		branch = "main",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("conf.bufferline")
		end,
	},

	-- SchemaStore
	-- { "b0o/schemastore.nvim" },

	-- {
	--     "RRethy/vim-illuminate",
	--     config = function()
	--         require("lvim.core.illuminate").setup()
	--     end,
	--     event = "User FileOpened",
	-- },

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("conf.indentlines")
		end,
	},

	-- {
	--     "lunarvim/bigfile.nvim",
	--     event = { "FileReadPre", "BufReadPre", "User FileOpened" },
	--     opts = {},
	-- },

	{
		"NvChad/nvterm",
		init = function()
			require("core.keys").load_module("terminal")
		end,
		opts = {},
	},

	-- buffer remove
	{
		"echasnovski/mini.bufremove",
        -- stylua: ignore
        keys = {
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
        },
	},
}
