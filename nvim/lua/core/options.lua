local o = vim.opt
local g = vim.g

local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

o.autowrite = true -- Enable auto write
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
opt.scrolloff = 8 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 4 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for

opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

opt.splitkeep = "screen"
opt.shortmess:append({ C = true })

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

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
o.colorcolumn = "80"
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

-- -- Set colorscheme
-- -- vim.g.gruvbox_material_transparent_background = 2
-- vim.opt.termguicolors = true
-- -- vim.cmd("colorscheme rose-pine-moon")

-- vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")
-- vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- -- Enable mouse mode
-- vim.opt.mouse = 'a'
-- -- Enable break indent
-- vim.opt.breakindent = true
-- -- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
--
--
-- { "  Find File", "Spc f f", "Telescope find_files" },
-- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
-- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
-- { "  Bookmarks", "Spc m a", "Telescope marks" },
-- { "  Themes", "Spc t h", "Telescope themes" },
-- { "  Mappings", "Spc c h", "NvCheatsheet" },

if vim.g.neovide then
	local alpha = function()
		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#0f1117" .. alpha()
end
