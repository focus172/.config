return {
    n = {
        ["<leader>dB"] = {
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            "Breakpoint Condition",
        },
        ["<leader>db"] = {
            require("dap").toggle_breakpoint,
            "Toggle Breakpoint",
        },
        ["<leader>dc"] = {
            require("dap").continue,
            "Continue",
        },
        -- {
        --     "<leader>dC",
        --     function() require("dap").run_to_cursor() end,
        --     desc =
        --     "Run to Cursor"
        -- },
        -- {
        --     "<leader>dg",
        --     function() require("dap").goto_() end,
        --     desc =
        --     "Go to line (no execute)"
        -- },
        -- {
        --     "<leader>di",
        --     function() require("dap").step_into() end,
        --     desc =
        --     "Step Into"
        -- },
        -- {
        --     "<leader>dj",
        --     function() require("dap").down() end,
        --     desc =
        --     "Down"
        -- },
        -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        -- {
        --     "<leader>dl",
        --     function() require("dap").run_last() end,
        --     desc =
        --     "Run Last"
        -- },
        -- {
        --     "<leader>do",
        --     function() require("dap").step_out() end,
        --     desc =
        --     "Step Out"
        -- },
        -- {
        --     "<leader>dO",
        --     function() require("dap").step_over() end,
        --     desc =
        --     "Step Over"
        -- },
        -- {
        --     "<leader>dp",
        --     function() require("dap").pause() end,
        --     desc =
        --     "Pause"
        -- },
        -- {
        --     "<leader>dr",
        --     function() require("dap").repl.toggle() end,
        --     desc =
        --     "Toggle REPL"
        -- },
        -- {
        --     "<leader>ds",
        --     function() require("dap").session() end,
        --     desc =
        --     "Session"
        -- },
        -- {
        --     "<leader>dt",
        --     function() require("dap").terminate() end,
        --     desc =
        --     "Terminate"
        -- },
        -- {
        --     "<leader>dw",
        --     function() require("dap.ui.widgets").hover() end,
        --     desc =
        --     "Widgets"
        -- },
    },
}
