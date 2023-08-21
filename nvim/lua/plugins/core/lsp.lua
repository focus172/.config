return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neoconf.nvim",  cmd = "Neoconf", config = false,      dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim",   opts = {} },
            { "hrsh7th/cmp-nvim-lsp" },

            { "j-hui/fidget.nvim",   tag = "legacy",  event = "LspAttach", opts = {} }
        },
        opts = {
            -- options for vim.diagnostic.config()
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                },
                severity_sort = true,
            },
            -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the inlay hints.
            inlay_hints = { enabled = false },
            servers = {},
        },
        config = function(_, opts)
            local on_attach = function(client, buffer)
                require("core.util").load_mappings("lspconf")

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(
                    buffer,
                    "Format",
                    function(_) vim.lsp.buf.format() end,
                    { desc = "Format current buffer with LSP" }
                )

                local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
                if opts.inlay_hints.enabled and inlay_hint then
                    if client.server_capabilities.inlayHintProvider then
                        inlay_hint(buffer, true)
                    end
                end

                local Keys = require("lazy.core.handler.keys")
                local function add(keymaps)
                    for _, keys in pairs(keymaps) do
                        local kopts = Keys.opts(keys)
                        kopts.silent = true
                        kopts.buffer = buffer
                        vim.keymap.set(keys.mode or "n", keys[1], keys[2], kopts)
                    end
                end


                for _, keymap in ipairs(require("keymaps.lsp")) do
                    add(keymap)
                end

                local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
                for _, keymap in ipairs(maps) do
                    add(keymap)
                end
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
}
