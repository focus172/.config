vim.loader.enable()

-- [[ bootstrap lazy ]] --
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

-- [[ initialization ]] --
require("core.options")

-- [[ load plugins ]] --
require("lazy").setup("plug", {
    defaults = { lazy = true },
    install = { colorscheme = { "tokyonight" } },
    change_detection = { enabled = false },
})

-- [[ More options ]]
require("core.keys")

-- See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
