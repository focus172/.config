--
-- init.lua
-- @Focus172
--

------------------------------ Lazy -------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- must be set for some plugins to load keybinds correctly
vim.g.mapleader = " "

require("lazy").setup({
    "numToStr/Comment.nvim",
    "nvim-tree/nvim-tree.lua",
    { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
    -- { "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
 --    "folke/trouble.nvim",
 --    "nvim-treesitter/playground",
 --    "theprimeagen/harpoon",
 --    "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
 --    "tpope/vim-fugitive",
 --    "nvim-treesitter/nvim-treesitter-context",
 --     { "VonHeikemen/lsp-zero.nvim",
 --        dependencies = {
 --            -- Core
 --            'neovim/nvim-lspconfig',
 --            'williamboman/mason.nvim',
 --            'williamboman/mason-lspconfig.nvim',
 -- 	        -- Autocompletion
 --            'hrsh7th/nvim-cmp',
 --            'hrsh7th/cmp-buffer',
 --            'hrsh7th/cmp-path',
 --            'saadparwaiz1/cmp_luasnip',
 --            'hrsh7th/cmp-nvim-lsp',
 --            'hrsh7th/cmp-nvim-lua',
 --            -- Snippets
 --            'L3MON4D3/LuaSnip',
 --            'rafamadriz/friendly-snippets',
 --    }},
    -- "folke/zen-mode.nvim",
    -- "github/copilot.vim",
    -- "eandrju/cellular-automaton.nvim",
    -- "laytan/cloak.nvim",
})


------------ Visuals ---------------- 
-- require("catppuccin").setup({ flavour = "mocha", transparent_background = true })
-- vim.cmd.colorscheme "catppuccin"
require('rose-pine').setup({ disable_background = true })
vim.cmd.colorscheme "rose-pine"


require('lualine').setup { sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
}}


------------------- Language ---------------------

require("nvim-treesitter.configs").setup {
    ensure_installed = {
	    "c", "lua", "vim",
	    "zig", "rust", "yuck",
	    "toml", "yaml", "scss",
	    "rasi", "jsonc"
    },
    auto_install = false,
}
vim.cmd "TSUpdate"


require("nvim-tree").setup()

------------------------------ Keybindings ---------------------------------

local map_key = vim.api.nvim_set_keymap
local map_lua = vim.keymap.set
local opts = { silent = true, noremap = true }


----------------- F Motions ---------------------

-- File veiw
map_key("n", "<Leader>fv", ":Ex<CR>", opts)
map_key("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)

-- Telescope commands
local tele_builtin = require('telescope.builtin')
map_lua('n', '<leader>ff', tele_builtin.find_files, opts)
map_lua('n', '<leader>fg', tele_builtin.live_grep, opts)
map_lua('n', '<leader>fb', tele_builtin.buffers, opts) 
map_lua('n', '<leader>fh', tele_builtin.help_tags, opts) 

 -- ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
 -- ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
 -- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
 -- ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },


----------------- W Motion ---------------------

map_key("n", "<leader>wh", "<C-w>h", opts)
map_key("n", "<leader>wl", "<C-w>l", opts)
map_key("n", "<leader>wj", "<C-w>j", opts)
map_key("n", "<leader>wk", "<C-w>k", opts)

-- allow for window navigation in insert mode, useful for getting out of terminal
map_key("i", "<C-h>", "<C-w>h", opts)
map_key("i", "<C-j>", "<C-w>j", opts)
map_key("i", "<C-k>", "<C-w>k", opts)
map_key("i", "<C-l>", "<C-w>l", opts)

----------------- G Motion --------------------

map_lua("n", "<leader>gc", tele_builtin.git_commits, opts)
map_lua("n", "<leader>gt", tele_builtin.git_status, opts)


-------------- N Motion -------------

map_key("n", "<Leader>nb", "<cmd>enew<CR>", opts) 


-------------- U Motion -------------
map_key("n", "<leader>u", ":UndotreeToggle<cr>", opts)

-- More molecular undo of text
-- map_key("i", "<C-u>", ".<c-g>u")
map_key("n", "<leader>U", "<c-g>u", opts)


------------------ S Motion -------------------

map_key("n", "<leader>sv", ":vs<CR>", opts)
map_key("n", "<leader>sh", ":sp<CR>", opts)
map_key("n", "<Leader>st", ":vnew term://fish<CR>", opts)


------------ / Motion --------------- 
-- instead of the ? vim binding use tele-find-grep
require("Comment").setup({
    -- ? == Shift + /
    opleader = { line = '/', block = '?' },
    -- extra = { above = 'k/', below = 'j/', eol = 'A/', },
    mappings = { basic = true, extra = false }
})
local comment_api = require('Comment.api')
map_lua("n", "<leader>/", comment_api.toggle.linewise.current, opts)


-- save
-- map_key("n", "<leader>s", ":w<CR>", opts)

-- line navigation
-- map_key("i", "<C-b>", "<ESC>^i", opts)
-- map_key("i", "<C-e>", "<End>", opts)

-- Copy all
-- map_key("n", "<C-c>", ":%y<CR>", opts)

--  ┌            ┐
--  │ Common box │
--  └            ┘

map_key("n", "<Leader>lu", ":Lazy update<CR>", opts)
map_key("n", "<Leader>a", "ggVG<c-$>", opts) 


-- map('n', ';', ':', { noremap = true } )

-- map <Leader>dv :DiffVifm<CR>
-- map <Leader>tv :TabVifm<CR>

-- " Make adjusing split sizes a bit more friendly
-- noremap <silent> <C-Left> :vertical resize +3<CR>
-- noremap <silent> <C-Right> :vertical resize -3<CR>
-- noremap <silent> <C-Up> :resize +3<CR>
-- noremap <silent> <C-Down> :resize -3<CR>
--
-- " Change 2 split windows from vert to horiz or horiz to vert
-- map <Leader>th <C-w>t<C-w>H
-- map <Leader>tk <C-w>t<C-w>K
--

--      "           ▄ ▄                   ",
--      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
--      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
--      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
--      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
--      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
--      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
--      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
--      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",


-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
--
-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
--
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- i hate vim registerts/macros
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");


-------------------------------------- options ------------------------------------------

local o = vim.opt
local g = vim.g

o.laststatus = 3 -- global statusline
o.showmode = false

o.cursorline = true

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
-- o.shiftround = true


o.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
o.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- Cursor wrap of h, l
o.whichwrap:append "<>[]hl"


-- Performance
o.lazyredraw = true;
o.shell = "fish"
o.shadafile = "NONE"

o.guicursor = ""

-- vim.opt.nu = true
-- vim.opt.wrap = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

vim.opt.scrolloff = 8
-- vim.opt.isfname:append("@-@")
-- vim.opt.colorcolumn = "80"

-- Set clipboard to use system clipboard
-- o.clipboard = "wl-copy"

-- Get rid of annoying viminfo file
o.viminfo = ""
o.viminfofile = "NONE"

-- Miscellaneous quality of life
-- o.ignorecase = true
-- o.ttimeoutlen = 5
-- o.hidden = true
-- o.wrap = false
-- o.backup = false
-- o.writebackup = false
-- o.errorbells = false
o.swapfile = false
-- o.showmode = false
-- o.pumheight = 6
-- o.splitright = true
-- o.splitbelow = true
o.completeopt = "menuone,noselect"

-- " Removes pipes | that act as seperators on splits
-- set fillchars+=vert:\ 

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25


-- disable some default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_ruby_provider"] = 0


