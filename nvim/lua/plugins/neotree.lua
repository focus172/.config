return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",
    keys = {
        { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "[F]ile [E]xpolrer" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_current",
            filtered_items = {
                visible = true,
            },
        },
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                nowait = true,
            },
        }
    },
}
