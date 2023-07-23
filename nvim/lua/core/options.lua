-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- local opt = vim.opt
-- local o = vim.opt
-- local g = vim.g
--
-- -- [[ ]] --
--
-- -------------------------------------- globals -----------------------------------------
-- g.transparency = true
--
-- -------------------------------------- options ------------------------------------------
--
-- o.scrolloff = 8
-- opt.laststatus = 3 -- global statusline
-- opt.showmode = true
--
-- opt.clipboard = "unnamedplus"
-- opt.cursorline = true
--
-- -- Indenting
-- opt.expandtab = true
-- opt.shiftwidth = 4
-- opt.smartindent = true
-- opt.tabstop = 4
-- opt.softtabstop = 4
--
-- opt.fillchars = { eob = " " }
-- opt.ignorecase = true
-- opt.smartcase = true
-- opt.mouse = "a"
--
-- -- Numbers
-- opt.number = true
-- opt.numberwidth = 2
-- -- opt.ruler = true
--
-- -- disable nvim intro
-- -- opt.shortmess:append "sI"
--
-- opt.signcolumn = "yes"
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.termguicolors = true
-- opt.timeoutlen = 400
-- opt.undofile = true
--
-- -- interval for writing swap file to disk, also used by gitsigns
-- opt.updatetime = 250
--
-- -- go to previous/next line with h,l,left arrow and right arrow
-- -- when cursor reaches end/beginning of line
-- opt.whichwrap:append("<>[]hl")
--
-- -- See `:help vim.o`
--
-- -- Set highlight on search
-- vim.o.hlsearch = false
--
-- -- Make line numbers default
-- vim.wo.number = true
--
-- -- Enable mouse mode
-- o.mouse = "a"
--
-- -- Sync clipboard between OS and Neovim.
-- --  Remove this option if you want your OS clipboard to remain independent.
-- --  See `:help 'clipboard'`
-- o.clipboard = "unnamedplus"
--
-- -- Enable break indent
-- o.breakindent = true
--
-- -- Save undo history
-- o.undofile = true
--
-- -- Case-insensitive searching UNLESS \C or capital in search
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
--
-- -- Keep signcolumn on by default
-- vim.wo.signcolumn = "yes"
--
-- o.colorcolumn = "80"
--
-- -- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeout = true
-- vim.o.timeoutlen = 300
--
-- -- Set completeopt to have a better completion experience
-- vim.o.completeopt = "menuone,noselect"
--
-- -- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors = true
--
-- -- disable some default providers
-- g["loaded_node_provider"] = 0
-- g["loaded_perl_provider"] = 0
-- g["loaded_python3_provider"] = 0
-- g["loaded_ruby_provider"] = 0
--
-- -- add binaries installed by mason.nvim to path
-- vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
--
-- -- telescope = { style = "borderless" }, -- borderless / bordered
-- --
-- -- { "  Find File", "Spc f f", "Telescope find_files" },
-- -- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
-- -- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
-- -- { "  Bookmarks", "Spc m a", "Telescope marks" },
-- -- { "  Themes", "Spc t h", "Telescope themes" },
-- -- { "  Mappings", "Spc c h", "NvCheatsheet" },
