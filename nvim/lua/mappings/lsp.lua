local M = {}

M.keys = {

    {
        "<leader>cd",
        vim.diagnostic.open_float,
        desc = "Line Diagnostics"
    },
    {
        "<leader>cl",
        "<cmd>LspInfo<cr>",
        desc = "Lsp Info"
    },
    {
        "gd",
        function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end,
        desc = "Goto Definition"
    },
    {
        "gr",
        "<cmd>Telescope lsp_references<cr>",
        desc = "References"
    },
    {
        "gD",
        vim.lsp.buf.declaration,
        desc = "Goto Declaration"
    },
    {
        "gI",
        function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end,
        desc = "Goto Implementation"
    },
    {
        "gy",
        function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end,
        desc = "Goto T[y]pe Definition"
    },
    {
        "K",
        vim.lsp.buf.hover,
        desc = "Hover"
    },
    {
        "gK",
        vim.lsp.buf.signature_help,
        desc = "Signature Help",
    },
    {
        "<c-k>",
        vim.lsp.buf.signature_help,
        mode = "i",
        desc = "Signature Help"
    },
    {
        "]d",
        vim.diagnostic.goto_next,
        desc = "Next Diagnostic"
    },
    {
        "[d",
        vim.diagnostic.goto_prev,
        desc = "Prev Diagnostic"
    },
    {
        "<leader>cf",
        vim.lsp.buf.format,
        desc = "Format Document",
    },
    {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
        mode = { "n", "v" },
    },
}

M.keys[#M.keys + 1] = {
    "<leader>cr",
    function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
    end,
    expr = true,
    desc = "Rename",
}

-- M._keys[#M._keys + 1] = { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }

return M.keys
