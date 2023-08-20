return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neoconf.nvim",  cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim",   opts = {} },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        opts = {
            -- options for vim.diagnostic.config()
            -- diagnostics = {
            --     underline = true,
            --     update_in_insert = false,
            --     virtual_text = {
            --         spacing = 4,
            --         source = "if_many",
            --         prefix = "●",
            --     },
            --     severity_sort = true,
            -- },
            -- -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
            -- -- Be aware that you also will need to properly configure your LSP server to
            -- -- provide the inlay hints.
            -- inlay_hints = {
            --     enabled = false,
            -- },
            -- -- Automatically format on save
            -- autoformat = true,
            -- -- Enable this to show formatters used in a notification
            -- -- Useful for debugging formatter issues
            -- format_notify = false,
            -- -- options for vim.lsp.buf.format
            -- -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- -- but can be also overridden when specified
            -- format = {
            --     formatting_options = nil,
            --     timeout_ms = nil,
            -- },
            servers = {},
        },
        config = function(_, opts)
            local on_attach = function(client, buffer)
                require("core.util").load_mappings("lspconf")

                -- Create a command `:Format` local to the LSP buffer
                -- vim.api.nvim_buf_create_user_command(
                -- bufnr,
                -- "Format",
                -- function(_) vim.lsp.buf.format() end,
                -- { desc = "Format current buffer with LSP" }
                -- )

                -- local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
                -- if opts.inlay_hints.enabled and inlay_hint then
                --         if client.server_capabilities.inlayHintProvider then
                --             inlay_hint(buffer, true)
                --         end
                -- end

                -- require("plugins.core.lsp.keymaps").on_attach(client, buffer)
            end

            -- Setup neovim lua configuration
            require("neodev").setup()

            -- vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            for server, _ in pairs(opts.servers) do
                local server_opts = vim.tbl_deep_extend(
                    "force",
                    { capabilities = capabilities, on_attach = on_attach },
                    opts.servers[server] or {}
                )

                require("lspconfig")[server].setup(server_opts)
            end

            -- 	require("lspconfig").rust_analyzer.setup({
            -- 		capabilities = capabilities,
            -- 		on_attach = on_attach,
            -- 	})
            --
            -- 	require("lspconfig").lua_ls.setup({
            -- 		capabilities = capabilities,
            -- 		on_attach = on_attach,
            -- 		Lua = {
            -- 			workspace = { checkThirdParty = false },
            -- 			telemetry = { enable = false },
            -- 		},
            -- 	})

            -- local register_capability = vim.lsp.handlers["client/registerCapability"]

            -- vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
            -- local ret = register_capability(err, res, ctx)
            -- local client_id = ctx.client_id
            -- local client = vim.lsp.get_client_by_id(client_id)
            -- local buffer = vim.api.nvim_get_current_buf()
            -- require("plugins.lsp.keymaps").on_attach(client, buffer)
            -- return ret
            -- end

            -- diagnostics
            -- for name, icon in pairs(require("core.config").icons.diagnostics) do
            -- name = "DiagnosticSign" .. name
            -- vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            -- end
        end,
    },

    -- formatters
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {
                    -- nls.builtins.formatting.fish_indent,
                    -- nls.builtins.diagnostics.fish,
                    -- nls.builtins.formatting.stylua,
                    -- nls.builtins.formatting.shfmt,
                    -- nls.builtins.diagnostics.flake8,
                },
            }
        end,
        config = function(opts)
            -- auto format on save
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            -- group = vim.api.nvim_create_augroup("NvimFormater", {}),
            -- callback = function()
            -- local buf = vim.api.nvim_get_current_buf()
            -- vim.lsp.buf.format({
            -- bufnr = buf,
            -- })
            -- end,
            -- })

            require('null-ls').setup(opts)
        end,
    },
}
