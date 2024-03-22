return {
    {
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

                    require("core.keys").load_module("lspconf", { buffer = bufnr })
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

            lspconfig.lua_ls.setup({
                on_attach = function(client, bufnr)
                    -- Done by NoneLs
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false

                    -- Done by Treesitter
                    client.server_capabilities.semanticTokensProvider = nil
                end,
                capabilities = capabilities,
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
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
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
    },

    -- Install nvim-cmp, and buffer source as a dependency
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            -- snippets
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("conf.luasnip")
                end,
            },
        },
        config = function()
            -- See `:help cmp`

            -- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local icons = require("icons")

            local opts = {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                formatting = {
                    format = function(_, item)
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end
                        return item
                    end,
                },
                window = {
                    completion = {},
                    documentation = {},
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-d>"] = nil, -- cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = nil, -- cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.close(),
                    -- ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ["<S-CR>"] = nil,

                    ["<Tab>"] = nil,
                    ["<S-Tab>"] = cmp.mapping.select_next_item(),
                    -- cmp.mapping.select_prev_item(cmp_select),
                    -- ['<CR>'] = cmp.mapping.confirm({
                    --     behavior = cmp.ConfirmBehavior.Replace,
                    --     select = false
                    -- }),
                    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    -- ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<Esc>"] = cmp.mapping.close(),
                },

                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            }

            cmp.setup(opts)
        end,
    },
}
