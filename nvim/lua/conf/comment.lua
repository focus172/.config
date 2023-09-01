
local opts = {
    -- operates on current line
    toggler = {
        line = 'gc',
        block = 'gb',
    },
    -- accepts any vim motion as selection operator
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    -- extra = {
    --     above = false,
    --     below = false,
    --     eol = false,
    -- },
    mappings = {
        basic = true,
        extra = false,
    },
}
require("Comment").setup(opts)
