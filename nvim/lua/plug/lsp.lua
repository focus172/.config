return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/neodev.nvim", opts = {} },
        { "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach", opts = {} },
        -- { "tamago324/nlsp-settings.nvim", cmd = "LspSettings", opts = {} },
    },
    opts = {
        servers = {
            zls = {},
            gleam = {},
            -- kotlin_language_server = {},
            -- hls = {},
            -- ocamllsp = {},
            lua_ls = {
                -- on_attach = function(client, bufnr)
                --     -- Done by NoneLs
                --     client.server_capabilities.documentFormattingProvider = false
                --     client.server_capabilities.documentRangeFormattingProvider = false
                --
                --     -- Done by Treesitter
                --     client.server_capabilities.semanticTokensProvider = nil
                -- end,
                -- capabilities = capabilities,
                settings = {
                    Lua = {
                        -- diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                -- [vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
                                [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                            checkThirdParty = false,
                        },
                        completion = { callSnippet = "Replace" },
                        telemetry = { enable = false },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local bufnr = ev.buf

                -- Enable completion triggered by <c-x><c-o>
                -- vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

                local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

                if inlay_hint then
                    inlay_hint(bufnr, true)
                end

                local map = function(mode, key, action, desc)
                    local opt = { buffer = bufnr }
                    opt["desc"] = desc
                    vim.keymap.set(mode, key, action, opt)
                end

                map("n", "K", vim.lsp.buf.hover, "LSP hover")

                -- map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
                map("n", "gd", function()
                    require("telescope.builtin").lsp_definitions({ reuse_win = true })
                end, "[G]oto [D]efinition")
                map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("n", "gi", vim.lsp.buf.implementation, "[G]o [I]mplementation")
                map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")

                -- return ":" .. require("inc_rename").config.cmd_name .. " " .. vim.fn.expand("<cword>")
                map("n", "<leader>cn", vim.lsp.buf.rename, "[C]ode Re[N]ame")
                map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
                map("n", "<leader>cf", function()
                    vim.lsp.buf.format({ async = true })
                end, "[C]ode [F]ormat")
                map("n", "<leader>cd", vim.diagnostic.open_float, "[C]ode [D]iagnostics")

                -- map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbol")
                -- map("n", "<leader>ls", vim.lsp.buf.signature_help, "LSP signature help")
                -- ["<leader>D"] = {
                --     vim.lsp.buf.type_definition,
                --     "LSP definition type",
                -- },

                map("n", "[d", vim.diagnostic.goto_prev, "Previous [D]iagnostic")
                map("n", "]d", vim.diagnostic.goto_next, "Next [D]iagnostic")
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem = {
            documentationFormat = { "markdown", "plaintext" },
            snippetSupport = true,
            preselectSupport = true,
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            deprecatedSupport = true,
            commitCharactersSupport = true,
            tagSupport = { valueSet = { 1 } },
            resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" },
            },
        }

        for server, _ in pairs(opts.servers) do
            local options = opts.servers[server] or {}

            if options.capabilities then
                local new = vim.deepcopy(capabilities)
                for k, v in pairs(options.capabilities) do
                    new[k] = v
                end
                options.capabilities = new
            else
                options.capabilities = capabilities
            end

            lspconfig[server].setup(options)
        end


        lspconfig.gopls.setup({
            -- capabilities = capabilities,
            -- cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
            settings = {
                gopls = {
                    completeUnimported = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        })

        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
            },
            severity_sort = true,
        })
    end,
}
