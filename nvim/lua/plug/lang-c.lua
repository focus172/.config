return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            clangd = {
                capabilities = { offsetEncoding = { "utf-16" } },
                -- keys = { { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" }, },
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
    },
}
