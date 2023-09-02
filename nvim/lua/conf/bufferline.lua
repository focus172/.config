local opts = {
    options = {
        indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "none",
        },
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "center",
                highlight = "Directory",
                separator = true,
            },
        },

        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,

        always_show_bufferline = true,
        -- diagnostics_indicator = function(_, _, diag)
        --     local icons = require("core.config").icons.diagnostics
        --     local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        --         .. (diag.warning and icons.Warn .. diag.warning or "")
        --     return vim.trim(ret)
        -- end,
    },
}

require("bufferline").setup(opts)
