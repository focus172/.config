return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- virtual text for the debugger
            "theHamsta/nvim-dap-virtual-text",
            -- "leoluz/nvim-dap-go",
        },
        init = function()
            require("core.keys").load_module("dap", {})
        end,
        config = function()
            local icons = require("icons")
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

            for name, sign in pairs(icons.dap) do
                sign = type(sign) == "table" and sign or { sign }
                vim.fn.sign_define(
                    "Dap" .. name,
                    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
                )
            end

            --         local dap = require("dap")
            --         local dapui = require("dapui")
            --
            --         -- Basic debugging keymaps, feel free to change to your liking!
            --         vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            --         vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
            --         vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
            --         vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
            --         vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            --         vim.keymap.set("n", "<leader>B", function()
            --             dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            --         end, { desc = "Debug: Set Breakpoint" })
            --
            --         -- Dap UI setup
            --         -- For more information, see |:help nvim-dap-ui|
            --         dapui.setup({
            --             -- Set icons to characters that are more likely to work in every terminal.
            --             --    Feel free to remove or use ones that you like more! :)
            --             --    Don't feel like these are good choices.
            --             icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            --             controls = {
            --                 icons = {
            --                     pause = "⏸",
            --                     play = "▶",
            --                     step_into = "⏎",
            --                     step_over = "⏭",
            --                     step_out = "⏮",
            --                     step_back = "b",
            --                     run_last = "▶▶",
            --                     terminate = "⏹",
            --                     disconnect = "⏏",
            --                 },
            --             },
            --         })
            --
            --         -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
            --         vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
            --
            --         dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            --         dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            --         dap.listeners.before.event_exited["dapui_config"] = dapui.close
            --
            --         -- Install golang specific config
            --         require("dap-go").setup()
        end,
    },

    -- fancy UI for the debugger
    {
        "rcarriga/nvim-dap-ui",
        -- stylua: ignore
        keys = {
            { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },

    -- which key integration
    {
        "folke/which-key.nvim",
        optional = true,
        opts = {
            defaults = {
                ["<leader>d"] = { name = "+debug" },
                ["<leader>da"] = { name = "+adapters" },
            },
        },
    },
}
