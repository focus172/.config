-- dont load the plugin
if true then return {} end

-- TODO: just use VSCODIUM whenever this is needed

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- "theHamsta/nvim-dap-virtual-text",
            -- "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
        },
        init = function()
            require("core.keys").load_module("dap", {})
        end,
        config = function()
            local dap = require("dap")
            if not dap.adapters["codelldb"] then
                require("dap").adapters["codelldb"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "codelldb",
                        args = {
                            "--port",
                            "${port}",
                        },
                    },
                }
            end
            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
                    {
                        type = "codelldb",
                        request = "launch",
                        name = "Launch file",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "codelldb",
                        request = "attach",
                        name = "Attach to process",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

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
        -- stylua: ignore
        keys = {
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
        },
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

    {
        "nvim-neotest/neotest",
        dependencies = {
            "rouge8/neotest-rust",
        },
        opts = {
            adapters = {
                ["neotest-rust"] = {},
            },
            status = { virtual_text = true },
            output = { open_on_run = true },
            quickfix = {
                open = function()
                    vim.cmd("Trouble quickfix")
                end,
            },
        },
        config = function(_, opts)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        -- Replace newline and tab characters with space for more compact diagnostics
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)

            if opts.adapters then
                local adapters = {}
                for name, config in pairs(opts.adapters or {}) do
                    if type(name) == "number" then
                        if type(config) == "string" then
                            config = require(config)
                        end
                        adapters[#adapters + 1] = config
                    elseif config ~= false then
                        local adapter = require(name)
                        if type(config) == "table" and not vim.tbl_isempty(config) then
                            local meta = getmetatable(adapter)
                            if adapter.setup then
                                adapter.setup(config)
                            elseif meta and meta.__call then
                                adapter(config)
                            else
                                error("Adapter " .. name .. " does not support setup")
                            end
                        end
                        adapters[#adapters + 1] = adapter
                    end
                end
                opts.adapters = adapters
            end

            require("neotest").setup(opts)
        end,
        -- stylua: ignore
        keys = {
            { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
            { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end,                          desc = "Run All Test Files" },
            { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Run Nearest" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
            { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
        },
    },
}
