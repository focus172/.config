-- local codelldb_path = "/usr/bin/rust-lldb"
-- local adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)

local opts = {
    -- dap = {
    -- 	adapter = adapter,
    -- },
    tools = {
        on_initialized = function()
            vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { desc = "Hover Actions (Rust)" })
            vim.keymap.set("n", "<leader>ca", "<cmd>RustCodeAction<cr>", { desc = "Code Actions (Rust)" })
            vim.keymap.set("n", "<leader>dr", "<cmd>RustDebuggables<cr>", { desc = "Run Debuggables (Rust)" })

            vim.cmd([[
                  augroup RustLSP
                    autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                    autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                  augroup END
                ]])
        end,
    },
}
require("rust-tools").setup(opts)

