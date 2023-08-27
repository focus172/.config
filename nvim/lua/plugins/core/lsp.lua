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
            servers = {},
        },
        config = function(_, opts)
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local bufnr = ev.buf

                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

                    if inlay_hint then
                        inlay_hint(bufnr, true)
                    end

                    local lsp_opts = { buffer = bufnr }
                    require("core.util").load_mappings("lspconf", lsp_opts)

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<space>f', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end,
            })
            -- Setup neovim lua configuration
            require("neodev").setup()


            local lspconfig = require("lspconfig")

            for server, _ in pairs(opts.servers) do
                local server_opts = opts.servers[server] or {}

                lspconfig[server].setup(server_opts)
            end

            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            -- diagnostics
            -- for name, icon in pairs(require("core.config").icons.diagnostics) do
            -- name = "DiagnosticSign" .. name
            -- vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            -- end
        end,
    },
}
