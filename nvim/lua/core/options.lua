local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

o.autowrite = true -- Enable auto write
o.clipboard = "unnamedplus" -- Sync with system clipboard. See `:help 'clipboard'`
o.completeopt = "menu,menuone,noselect"
o.conceallevel = 3 -- Hide * markup for bold and italic
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.cursorline = true -- Enable highlighting of the current line
o.expandtab = true -- Use spaces instead of tabs
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 0
o.list = true -- Show some invisible characters (tabs...
o.mouse = "a" -- Enable mouse mode
o.number = true -- Print line number
o.pumblend = 10 -- Popup blend
o.pumheight = 10 -- Maximum number of entries in a popup
o.relativenumber = true -- Relative line numbers
o.scrolloff = 8 -- Lines of context
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
o.shiftround = true -- Round indent
o.shortmess:append({ W = true, I = true, c = true })
o.showmode = false -- Dont show mode since we have a statusline
o.sidescrolloff = 4 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.spelllang = { "en" }
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current

o.shiftwidth = 4 -- Size of an indent
o.tabstop = 4 -- Number of spaces tabs count for

o.termguicolors = true -- True color support
o.timeoutlen = 300
o.undofile = true
o.undolevels = 10000
o.updatetime = 200 -- Save swap file and trigger CursorHold
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
o.wrap = false -- Disable line wrap

o.splitkeep = "screen"
o.shortmess:append({ C = true })

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- [[ ]] --

-------------------------------------- globals -----------------------------------------
g.transparency = true

-------------------------------------- options ------------------------------------------
-- opt.laststatus = 3 -- global statusline
-- opt.showmode = true
-- opt.cursorline = true

-- Indenting
-- opt.expandtab = true
-- opt.shiftwidth = 4
-- opt.smartindent = true
-- opt.tabstop = 4
-- opt.softtabstop = 4

-- opt.fillchars = { eob = " " }
-- opt.ignorecase = true
-- opt.smartcase = true
-- opt.mouse = "a"

-- Numbers
-- opt.number = true
-- opt.numberwidth = 2
-- opt.ruler = true
--
-- disable nvim intro
-- opt.shortmess:append "sI"
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
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
o.whichwrap:append("<>[]hl")
--
-- -- See `:help vim.o`
--
-- -- Set highlight on search
-- vim.o.hlsearch = false
--
-- Make line numbers default
-- vim.wo.number = true

-- Enable break indent
-- o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- Keep signcolumn on by default
-- vim.wo.signcolumn = "yes"

o.colorcolumn = "80"

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeout = true
-- vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_ruby_provider"] = 0

-- [[ Setting options ]]
-- vim.g.netrw_liststyle = 3 -- Set netrw in tree view
-- vim.g.netrw_altv = true   -- Open new pane in netrw on the right

-- vim.opt.nu = true
-- vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true
-- vim.opt.wrap = false
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/nvim/undodir"
-- vim.opt.undofile = true

-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")
-- vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- Enable break indent
-- vim.opt.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true


-- { "  Find File", "Spc f f", "Telescope find_files" },
-- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
-- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
-- { "  Bookmarks", "Spc m a", "Telescope marks" },
-- { "  Themes", "Spc t h", "Telescope themes" },
-- { "  Mappings", "Spc c h", "NvCheatsheet" },


if g.neovide then
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    g.neovide_transparency = 0.0
    g.transparency = 0.8
    g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * g.transparency))
end
