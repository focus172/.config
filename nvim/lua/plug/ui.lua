return {
    -- Better `vim.notify()`
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            -- needed to not fuck things up
            background_colour = "#000000",
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.3)
            end,
        },
        config = function(opts)
            local notify = require("notify")
            notify.setup(opts)
            vim.notify = notify
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline",
            },
            {
                "<leader>snl",
                function()
                    require("noice").cmd("last")
                end,
                desc = "Noice Last Message",
            },
            {
                "<leader>snh",
                function()
                    require("noice").cmd("history")
                end,
                desc = "Noice History",
            },
            {
                "<leader>sna",
                function()
                    require("noice").cmd("all")
                end,
                desc = "Noice All",
            },
            {
                "<leader>snd",
                function()
                    require("noice").cmd("dismiss")
                end,
                desc = "Dismiss All",
            },
            {
                "<c-f>",
                function()
                    if not require("noice.lsp").scroll(4) then
                        return "<c-f>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll forward",
                mode = { "i", "n", "s" },
            },
            {
                "<c-b>",
                function()
                    if not require("noice.lsp").scroll(-4) then
                        return "<c-b>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll backward",
                mode = { "i", "n", "s" },
            },
        },
    },

    -- lsp symbol navigation for lualine. This shows where
    -- in the code structure you are - within functions, classes,
    -- etc - in the statusline.
    {
        "SmiteshP/nvim-navic",
        init = function()
            vim.g.navic_silence = true

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buffer = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, buffer)
                    end
                end,
            })
        end,
        opts = {
            separator = " ",
            highlight = true,
            depth_limit = 5,
            icons = require("icons").kind,
        },
    },
}
