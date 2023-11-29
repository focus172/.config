local opts = {
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
    servers = {
        -- ocamllsp = { filetypes = { 'ocaml' } }
        lua_ls = {
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    completion = { callSnippet = "Replace" },
                    telemetry = { enable = false },
                },
            },
        },

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
        kotlin_language_server = {},
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

        zls = {},
        hls = {},

        clangd = {
            keys = {
                { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_dir = function(fname)
                return require("lspconfig.util").root_pattern(
                    "Makefile",
                    "CMakeLists.txt",
                    "configure.ac",
                    "configure.in",
                    "config.h.in",
                    "meson.build",
                    "meson_options.txt",
                    "build.ninja"
                )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
                    fname
                ) or require("lspconfig.util").find_git_ancestor(fname)
            end,
            capabilities = {
                offsetEncoding = { "utf-16" },
            },
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        },
    },
    setup = {
        clangd = function(_, opts)
            local clangd_ext_opts = {
                extensions = {
                    inlay_hints = {
                        inline = false,
                    },
                    ast = {
                        --These require codicons (https://github.com/microsoft/vscode-codicons)
                        role_icons = {
                            type = "",
                            declaration = "",
                            expression = "",
                            specifier = "",
                            statement = "",
                            ["template argument"] = "",
                        },
                        kind_icons = {
                            Compound = "",
                            Recovery = "",
                            TranslationUnit = "",
                            PackExpansion = "",
                            TemplateTypeParm = "",
                            TemplateTemplateParm = "",
                            TemplateParamObject = "",
                        },
                    },
                },
                server = opts
            }
            require("clangd_extensions").setup(clangd_ext_opts)
            return true
        end,
    },
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local bufnr = ev.buf

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

        if inlay_hint then
            inlay_hint(bufnr, true)
        end

        local lsp_opts = { buffer = bufnr }
        require("core.keys").load_module("lspconf", lsp_opts)
    end,
})

-- Setup neovim lua configuration
-- this is done automagically as it is dep of this config
-- require("neodev").setup()

local lspconfig = require("lspconfig")

for server, _ in pairs(opts.servers) do
    local server_opts = opts.servers[server] or {}

    if opts.setup[server] then
        opts.setup[server]()
    end

    lspconfig[server].setup(server_opts)
end

vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

-- diagnostics
-- for name, icon in pairs(require("core.config").icons.diagnostics) do
-- name = "DiagnosticSign" .. name
-- vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
-- end

-- local M = {}
-- -- local utils = require("core.utils")
--
-- M.on_attach = function(client, bufnr)
-- 	client.server_capabilities.documentFormattingProvider = false
-- 	client.server_capabilities.documentRangeFormattingProvider = false
--
-- 	-- utils.load_mappings("lspconfig", { buffer = bufnr })
--
-- 	client.server_capabilities.semanticTokensProvider = nil
-- end
--
-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- M.capabilities.textDocument.completion.completionItem = {
-- 	documentationFormat = { "markdown", "plaintext" },
-- 	snippetSupport = true,
-- 	preselectSupport = true,
-- 	insertReplaceSupport = true,
-- 	labelDetailsSupport = true,
-- 	deprecatedSupport = true,
-- 	commitCharactersSupport = true,
-- 	tagSupport = { valueSet = { 1 } },
-- 	resolveSupport = {
-- 		properties = {
-- 			"documentation",
-- 			"detail",
-- 			"additionalTextEdits",
-- 		},
-- 	},
-- }
--
-- local lspconfig = require("lspconfig")
--
-- lspconfig.lua_ls.setup({
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
--
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 					[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
-- 					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
-- 				},
-- 				maxPreload = 100000,
-- 				preloadFileSize = 10000,
-- 			},
-- 		},
-- 	},
-- })
--
-- lspconfig.gopls.setup({
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- 	cmd = { "gopls" },
-- 	filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- 	root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
-- 	settings = {
-- 		gopls = {
-- 			completeUnimported = true,
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 		},
-- 	},
-- })
--
-- lspconfig.zls.setup({
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- 	cmd = { "/usr/bin/zls" },
-- 	filetypes = { "zig" },
-- 	root_dir = lspconfig.util.root_pattern("build.zig"),
-- })
--
-- lspconfig.pyright.setup({
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- 	filetypes = { "python" },
-- })
--
-- return M
