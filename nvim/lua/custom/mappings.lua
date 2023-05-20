local M = {}

M.general = {
  n = {
    -- Overide of vim + tmux
    ["C-h"] = {"<cmd> TmuxNavigateLeft <CR>", "Window left"},
    ["C-j"] = {"<cmd> TmuxNavigateDown <CR>", "Window down"},
    ["C-k"] = {"<cmd> TmuxNavigateUp <CR>", "Window up"},
    ["C-l"] = {"<cmd> TmuxNavigateRight <CR>", "Window right"},

    ["q"] = {"<nop>", "Vim macros are garbage"},
    ["Q"] = {"<nop>", "I dont know what this does"},

    ["<leader>n"] = {"<nop>", "todo!(find a use for this)"},
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

return M
