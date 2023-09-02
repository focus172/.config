local M = {}

M.bootstrap = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
end

M.load = function()
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
        change_detection = {
            enabled = false,
            -- notify = true,
        },
    })
end

return M
