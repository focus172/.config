return {
    -- toggle comment in both modes
    n = {
        ["gc"] = {
            require("Comment.api").toggle.linewise.current,
            "Toggle comment",
        },
    },

    v = {
        ["gc"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "Toggle comment",
        },
    },
}
