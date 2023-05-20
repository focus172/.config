local M = {}

M.general = {
    i = {
        ["<A-j>"] = {"<Esc> <cmd>m .+1<CR>==gi", "Move line down"},
        ["<A-k>"] = {"<Esc> <cmd>m .-2<CR>==gi", "Move line up"},
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
        ["<A-k>"] = {"<cmd> m .-2<CR>==", "Move line up"},

    },

    v = {
        ["<"] = {"<gv", "Remove indent"},
        [">"] = {">gv", "Add indent"},

        ["<A-j>"] = {":m '>+1<CR>gv-gv", "Move selection up"},
        ["<A-k>"] = {":m '>-2<CR>gv-gv", "Move selection up"},
    }
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugger sidebar"
    }
  }
}

M.copilot = {
    i = {
        -- ["<Tab>"] = 
    }
}

return M
