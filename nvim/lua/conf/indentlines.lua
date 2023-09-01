-- See `:help indent_blankline.txt`
local opts = {
    -- char = '┊',
    indentLine_enabled = 1,
    filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "nvdash",
        "nvcheatsheet",
        "",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = true,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
}

require("indent_blankline").setup(opts)
