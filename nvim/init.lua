-- --------- --
-- init.lua  --
-- @Focus172 --
-- --------- --

-- initializing lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print("lazy path: " .. lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	require "plugins"
})

require "options"
require "mappings"
require "autocmds"
