return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function(_, opts)
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
				sources = {
					-- nls.builtins.formatting.rustfmt,
					-- nls.builtins.formatting.brittany, -- haskell
					-- nls.builtins.formatting.alejandra, -- nix
					nls.builtins.formatting.gofmt, -- go
					-- nls.builtins.formatting.ktlint, -- kotlin
					nls.builtins.formatting.stylua, -- lua
					-- nls.builtins.formatting.trim_whitespace,
					-- nls.builtins.formatting.zigfmt,

					-- nls.builtins.diagnostics.credo, -- elixir, requires mix

					-- [[ python things ]]
					-- nls.builtins.diagnostics.mypy,
					-- nls.builtins.diagnostics.ruff,
					-- nls.builtins.formatting.black

					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					nls.builtins.formatting.shfmt,
					-- nls.builtins.diagnostics.shellcheck,
				},
			}
		end,
		config = function(_, opts)
			-- auto format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("NvimFormater", {}),
				callback = function()
					local buf = vim.api.nvim_get_current_buf()
					vim.lsp.buf.format({
						bufnr = buf,
					})
				end,
			})

			require("null-ls").setup(opts)
		end,
	},
}
