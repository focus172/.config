local null_ls = require("null-ls")

local opts = {
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
    sources = {
        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.formatting.brittany, -- haskell
        -- null_ls.builtins.formatting.alejandra, -- nix
        null_ls.builtins.formatting.gofmt,  -- go
        -- null_ls.builtins.formatting.ktlint, -- kotlin
        null_ls.builtins.formatting.stylua, -- lua
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.zigfmt,
        null_ls.builtins.diagnostics.shellcheck,

        -- null_ls.builtins.diagnostics.credo, -- elixir, requires mix

        -- python things
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.ruff,
        -- null_ls.builtins.formatting.black

        -- nls.builtins.formatting.fish_indent,
        -- nls.builtins.diagnostics.fish,
        -- nls.builtins.formatting.shfmt,
    }
}

-- auto format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = vim.api.nvim_create_augroup("NvimFormater", {}),
--     callback = function()
--         local buf = vim.api.nvim_get_current_buf()
--         vim.lsp.buf.format({
--             bufnr = buf,
--         })
--     end,
-- })

require("null-ls").setup(opts)
