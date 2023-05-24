local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
    server = {on_attach = on_attach, capabilities = capabilities},
    init_options = {num_threads = 4}
}
return options
