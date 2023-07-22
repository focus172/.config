local opt = vim.opt
local o = vim.opt
local g = vim.g



-- theme = 'gruvbox',
-- theme_toggle = {"gruvbox", "rosepine"},
-- transparency = true,

-------------------------------------- globals -----------------------------------------
--  
-- g.transparency = true

-------------------------------------- options ------------------------------------------

o.scrolloff = 8
opt.laststatus = 3 -- global statusline
opt.showmode = true

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
-- opt.ruler = true

-- disable nvim intro
-- opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
o.clipboard = 'unnamedplus'

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'


o.colorcolumn = "80"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath "data" .. "/mason/bin"

-- telescope = { style = "borderless" }, -- borderless / bordered
--
-- { "  Find File", "Spc f f", "Telescope find_files" },
-- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
-- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
-- { "  Bookmarks", "Spc m a", "Telescope marks" },
-- { "  Themes", "Spc t h", "Telescope themes" },
-- { "  Mappings", "Spc c h", "NvCheatsheet" },

-------------------------------------- commands ------------------------------------------

