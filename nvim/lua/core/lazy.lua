require("lazy").setup("plug", {
    defaults = { lazy = true },
    install = { colorscheme = { "tokyonight" } },
    ui = {
        icons = {
            ft = "",
            lazy = "󰂠 ",
            loaded = "",
            not_loaded = "",
        },
    },
    change_detection = { enabled = true },
})
