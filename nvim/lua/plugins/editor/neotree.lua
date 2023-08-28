return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    -- init = function()
    --     if vim.fn.argc() == 1 then
    --         local stat = vim.loop.fs_stat(vim.fn.argv(0))
    --         if stat and stat.type == "directory" then
    --             require("neo-tree")
    --         end
    --     end
    -- end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true,
            bind_to_cwd = false,
            filtered_items = {
                visible = true,
            },
        },
        window = {
            position = "left",
            width = 30,
            mappings = {
                ["<space>"] = "none",
            },
            mapping_options = {
                nowait = true,
            },
        }
    },
}
