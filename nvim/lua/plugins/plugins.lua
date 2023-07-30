if true then
    return {}
end

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.conf.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require("plugins.configs.cmp")
            table.insert(M.sources, { name = "crates" })
            M.mapping["<S-Tab>"] = M.mapping["<Tab>"]
            M.mapping["<Tab>"] = nil
            return M
        end,
    },
    { "mfussenegger/nvim-dap" },
    { "christoomey/vim-tmux-navigator", lazy = false },
    { "theprimeagen/harpoon",           cmd = "HarpoonAddTerm" },
    { "mbbill/undotree",                cmd = "UndotreeToggle" },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufRead",
        opts = function()
            return require("custom.conf.nullls")
        end,
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
    { "stevearc/oil.nvim",                      lazy = false },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        },
    },
}
