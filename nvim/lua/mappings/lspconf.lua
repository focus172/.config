return {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
    -- {
    --     "<leader>cl",
    --     "<cmd>LspInfo<cr>",
    --     desc = "Lsp Info"
    -- },
    -- {
    --     "gd",
    --     function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end,
    --     desc = "Goto Definition"
    -- },
    -- {
    --     "gr",
    --     "<cmd>Telescope lsp_references<cr>",
    --     desc = "References"
    -- },
    -- {
    --     "gD",
    --     vim.lsp.buf.declaration,
    --     desc = "Goto Declaration"
    -- },
    -- {
    --     "gI",
    --     function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end,
    --     desc = "Goto Implementation"
    -- },
    -- {
    --     "gy",
    --     function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end,
    --     desc = "Goto T[y]pe Definition"
    -- },
    -- {
    --     "K",
    --     vim.lsp.buf.hover,
    --     desc = "Hover"
    -- },
    -- {
    --     "gK",
    --     vim.lsp.buf.signature_help,
    --     desc = "Signature Help",
    -- },
    -- {
    --     "<c-k>",
    --     vim.lsp.buf.signature_help,
    --     mode = "i",
    --     desc = "Signature Help"
    -- },
    -- {
    --     "]d",
    --     vim.diagnostic.goto_next,
    --     desc = "Next Diagnostic"
    -- },
    -- {
    --     "[d",
    --     vim.diagnostic.goto_prev,
    --     desc = "Prev Diagnostic"
    -- },
    -- {
    --     "<leader>cf",
    --     vim.lsp.buf.format,
    --     desc = "Format Document",
    -- },
    n = {
        ["<leader>cd"] = {
            vim.diagnostic.open_float,
            "Line Diagnostics",
        },

        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "LSP declaration",
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "LSP definition",
        },

        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "LSP hover",
        },

        ["gi"] = {
            vim.lsp.buf.implementation,
            "LSP implementation",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "LSP signature help",
        },

        ["<leader>D"] = {
            vim.lsp.buf.type_definition,
            "LSP definition type",
        },

        ["<leader>rn"] = {
            function()
                return ":" .. require("inc_rename").config.cmd_name .. " " .. vim.fn.expand("<cword>")
            end,
            -- expr = true,
            "Rename",
        },

        -- ["todo"] = {
        --  function()
        --      vim.lsp.buf.rename()
        --  end,
        --    "Lsp Rename"
        -- },

        ["<leader>ca"] = {
            vim.lsp.buf.code_action,
            "LSP code action",
            -- mode = { "n", "v" },
        },


        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "LSP references",
        },

        -- ["<leader>f"] = {
        --   function()
        --     vim.diagnostic.open_float { border = "rounded" }
        --   end,
        --   "Floating diagnostic",
        -- },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev({ float = { border = "rounded" } })
            end,
            "Goto prev",
        },

        ["]d"] = {
            function()
                vim.diagnostic.goto_next({ float = { border = "rounded" } })
            end,
            "Goto next",
        },

        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Diagnostic setloclist",
        },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format({ async = true })
            end,
            "LSP formatting",
        },

        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "Add workspace folder",
        },

        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "Remove workspace folder",
        },

        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List workspace folders",
        },
    },
}
