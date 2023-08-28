return {
    -- formatters
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
                sources = {
                    -- nls.builtins.formatting.fish_indent,
                    -- nls.builtins.diagnostics.fish,
                    -- nls.builtins.formatting.shfmt,
                },
            }
        end,
        config = function(opts)
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

            require('null-ls').setup(opts)
        end,
    }
}
