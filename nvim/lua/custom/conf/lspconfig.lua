local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            }
        }
    }
}

lspconfig.zls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"/usr/bin/zls"},
    filetypes = {"zig"},
    root_dir = lspconfig.util.root_pattern("build.zig"),
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
}

lspconfig.csharp_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
