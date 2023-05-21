local M = {}

M.general = {
    i = {
        ["<A-j>"] = {"<Esc> <cmd>m .+1<CR>==gi", "Move line down"},
        ["<A-k>"] = {"<Esc> <cmd>m .-2<CR>==gi", "Move line up"}
    },

    n = {
        -- Overide of vim + tmux
        ["<C-h>"] = {"<cmd> TmuxNavigateLeft <CR>", "Window left"},
        ["<C-j>"] = {"<cmd> TmuxNavigateDown <CR>", "Window down"},
        ["<C-k>"] = {"<cmd> TmuxNavigateUp <CR>", "Window up"},
        ["<C-l>"] = {"<cmd> TmuxNavigateRight <CR>", "Window right"},

        ["q"] = {"<nop>", "Vim macros are garbage"},
        ["Q"] = {"<nop>", "I dont know what this does"},

        ["<leader>n"] = {"<cmd> cnext <CR> zz", "See the next error"},
        ["<leader>N"] = {"<cmd> cnext <CR> zz", "See the next error"},

        ["<A-j>"] = {"<cmd> m .+1<CR>==", "Move line down"},
        ["<A-k>"] = {"<cmd> m .-2<CR>==", "Move line up"}

    },

    v = {
        ["<"] = {"<gv", "Remove indent"},
        [">"] = {">gv", "Add indent"},

        ["<A-j>"] = {":m '>+1<CR>gv-gv", "Move selection up"},
        ["<A-k>"] = {":m '>-2<CR>gv-gv", "Move selection up"}
    }
}

M.dap = {
    n = {
        ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint"},
        ["<leader>dus"] = {
            function()
                local widgets = require "dap.ui.widgets"
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end, "Open debugger sidebar"
        }
    }
}

M.trouble = {
    i = {["<C-t>"] = {"<cmd> TroubleToggle<CR>", "Toggle Trouble"}},
    n = {
        ["<leader>tx"] = {"<cmd> TroubleToggle<CR>", "Toggle Trouble"},
        ["<leader>tw"] = {
            "<cmd> TroubleToggle lsp_workspace_diagnostics<CR>",
            "Toggle Workspace Trouble"
        },
        ["<leader>td"] = {
            "<cmd> TroubleToggle lsp_document_diagnostics<CR>",
            "Toggle Document Trouble"
        },
        ["<leader>tl"] = {
            "<cmd> TroubleToggle loclist<CR>", "Toggle Loclist Trouble"
        },
        ["<leader>tq"] = {
            "<cmd> TroubleToggle quickfix<CR>", "Toggle Quickfix Trouble"
        }
        -- ["<leader>gr"] = {"<cmd> TroubleToggle lsp_references<CR>", "Toggle References Trouble"},
    }
}

M.null_ls = {
    i = {
        ["<C-t>"] = {"<cmd> lua vim.lsp.buf.format()<CR>", "Format"},
        ["<C-space>"] = {"<cmd> lua vim.lsp.buf.hover()<CR>", "Hover"}
    },
    n = {
        ["<leader>cf"] = {"<cmd> lua vim.lsp.buf.format()<CR>", "Format"},
        ["<leader>rn"] = {"<cmd> lua vim.lsp.buf.rename()<CR>", "Rename"},
        ["<leader>gi"] = {
            "<cmd> lua vim.lsp.buf.implementation()<CR>", "Go to Implementation"
        },
        ["<leader>gr"] = {
            "<cmd> lua vim.lsp.buf.references()<CR>", "Go to References"
        },
        ["<leader>sd"] = {
            "<cmd> lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
            "Show Line Diagnostics"
        }
        -- ["<leader>sr"] = {
        --     "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>",
        --     "Go to Previous Diagnostic"
        -- },
        -- ["<leader>sn"] = {
        --     "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>",
        --     "Go to Next Diagnostic"
        -- },
        -- ["<leader>sp"] = {
        --     "<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>", "Set Loclist"
        -- }
    }
}

M.rust_tools = {
    n = {
        ["<leader>rr"] = {"<cmd> RustRunnables <CR>", "Run Rust Code"},
        ["qK"] = {"<cmd> RustHoverActions <CR>", "Hover"},
        ["<leader>rc"] = {"<cmd> RustOpenCargo <CR>", "Open Cargo Toml"},
        ["<leader>rm"] = {"<cmd> RustExpandMacro <CR>", "Expand Macro"},
        ["<leader>gm"] = {"<cmd> RustParentModule <CR>", "Go to rust parent module"},
    }
}

return M
