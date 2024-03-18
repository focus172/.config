return {
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show() -- should not be nessisary but is
		end,
	},

	{
		"simrat39/rust-tools.nvim",
		event = "BufReadPre rust",
		ft = "rust",
		opts = {
			tools = {
				on_initialized = function()
					vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { desc = "Hover Actions (Rust)" })
					vim.keymap.set("n", "<leader>ca", "<cmd>RustCodeAction<cr>", { desc = "Code Actions (Rust)" })
					vim.keymap.set("n", "<leader>dr", "<cmd>RustDebuggables<cr>", { desc = "Run Debuggables (Rust)" })

					vim.cmd([[
                        augroup RustLSP
                            autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                            autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                            autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                        augroup END
                        ]])
				end,
			},
		},
	},

	-- TODO: add lang opts here
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {

				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								runBuildScripts = true,
							},
							-- Add clippy lints for Rust.
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
							init_options = { num_threads = 4 },
						},
					},
				},
				taplo = {
					keys = {
						{
							"K",
							function()
								if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
									require("crates").show_popup()
								else
									vim.lsp.buf.hover()
								end
							end,
							desc = "Show Crate Documentation",
						},
					},
				},
			},
		},
	},
}
