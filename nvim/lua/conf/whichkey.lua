-- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.

local opts = {
    plugins = { spelling = true },
    defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surrond" },
        ["gc"] = { name = "+comment" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>un"] = { name = "+noice" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>da"] = { name = "+adapters" },
        ["<leader>t"] = { name = "+test" },
    },
}

vim.o.timeout = true
vim.o.timeoutlen = 200

local wk = require("which-key")
wk.setup(opts)
wk.register(opts.defaults)
