--
-- init.lua
-- @Focus172
--

------------------------------ Lazy ------------------------------------
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
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
	{ "rose-pine/neovim", name = "rose-pine" },
    { "folke/tokyonight.nvim" },
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/trouble.nvim",
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "nvim-treesitter/nvim-treesitter-context",
    { "VonHeikemen/lsp-zero.nvim", dependencies = {
        -- Core
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    }},
    "folke/zen-mode.nvim",
    "folke/twilight.nvim", -- use with zen mode
    "github/copilot.vim",
    'akinsho/toggleterm.nvim',

   -- BEGIN LVIM CONFIG

    { "tamago324/nlsp-settings.nvim", lazy = true },
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
    { "Tastyep/structlog.nvim", lazy = true },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    },
    {
        "tamago324/lir.nvim",
        event = "User DirOpened",
    },

    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
    "akinsho/bufferline.nvim",

    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",

    "b0o/schemastore.nvim",
})


require("nvim-tree").setup()

------------ Visuals ---------------- 
require('rose-pine').setup({ disable_background = true })
vim.cmd.colorscheme "rose-pine-moon"
-- require('tokyonight').setup({ transparent = true })
-- vim.cmd.colorscheme "tokyonight-night"

require('lualine').setup { sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
}}

----------- Language ---------------

require("nvim-treesitter.configs").setup {
    ensure_installed = {
	    "c", "lua", "vim",
	    "zig", "rust", "yuck",
	    "toml", "yaml", "scss",
	    "rasi", "jsonc", -- "elixir"
    },
    auto_install = false,
}
vim.cmd "TSUpdate"

------------------------------ Space is Leader ---------------------------------

local map_key = vim.api.nvim_set_keymap
local map_lua = vim.keymap.set
local opts = { silent = true, noremap = true }

----------------- F (file) Motions ---------------------

-- File veiw
map_key("n", "<Leader>fv", ":Ex<CR>", opts)
map_key("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)

-- Telescope commands
local tele_builtin = require('telescope.builtin')
map_lua('n', '<leader>ff', tele_builtin.find_files, opts)
map_lua('n', '<leader>fg', tele_builtin.live_grep, opts)
map_lua('n', '<leader>fb', tele_builtin.buffers, opts)
map_lua('n', '<leader>fh', tele_builtin.help_tags, opts)
map_key('n', "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", opts)
map_lua('n', "<leader>fo", tele_builtin.oldfiles, opts)
map_lua('n', "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", opts)


----------------- W (window) Motion ---------------------

map_key("n", "<leader>wh", "<C-w>h", opts)
map_key("n", "<leader>wl", "<C-w>l", opts)
map_key("n", "<leader>wj", "<C-w>j", opts)
map_key("n", "<leader>wk", "<C-w>k", opts)

-- allow for window navigation in insert mode, useful for getting out of terminal
map_key("i", "<C-h>", "<C-w>h", opts)
map_key("i", "<C-j>", "<C-w>j", opts)
map_key("i", "<C-k>", "<C-w>k", opts)
map_key("i", "<C-l>", "<C-w>l", opts)

----------------- G (git) Motion --------------------

map_lua("n", "<leader>gc", tele_builtin.git_commits, opts)
map_lua("n", "<leader>gt", tele_builtin.git_status, opts)
map_lua("n", "<leader>gs", vim.cmd.Git, opts)
-- vim.keymap.set("n", "<leader>gp", vim.cmd.Git('push'), opts)
-- vim.keymap.set("n", "<leader>gP", vim.cmd.Git({'pull',  '--rebase'}), opts)
-- vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);

-------------- B (buffer) Motion -------------

map_key("n", "<Leader>bn", "<cmd>enew<CR>", opts)
map_key("n", "<Leader>ba", "ggVG<c-$>", opts)

-------------- U (undo) Motion -------------
map_key("n", "<leader>u", ":UndotreeToggle<cr>", opts)

-- More molecular undo of text
map_key("n", "<leader>U", "<c-g>u", opts)

------------------ S (split) Motion -------------------


-- https://raw.githubusercontent.com/akinsho/toggleterm.nvim/main/README.md
-- Add to config from here
require("toggleterm").setup()

map_key("n", "<leader>sv", ":vs<CR>", opts)
map_key("n", "<leader>sh", ":sp<CR>", opts)
map_key("n", "<Leader>st", ":ToggleTerm<CR>", opts)

------------ / (comment) Motion --------------- 
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

-- map_key("n", "<Leader>lu", ":Lazy update<CR>", opts)

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
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--------------------------------- keybindings Q leader ---------------------






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

-- vim.opt.nu = true
-- vim.opt.wrap = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

o.scrolloff = 8
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
g["loaded_node_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_ruby_provider"] = 0


-- vim.keymap.set('n', '<leader>ps', function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- require('refactoring').setup({})
-- vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})


-------------------------- Harpoon ------------------------------

-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")

-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end)


vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
end)

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)



---------------------- LSP --------------------
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  -- 'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- map_lua("i", "<S-Tab>", cmp.mapping.select_next_item(cmp_select), opts)

local cmp_mappings = lsp.defaults.cmp_mappings({
  -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<S-Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  -- ["<CR>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  -- local opts = {buffer = bufnr, remap = false}

    -- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- local defaults = {
--   insert_mode = {
--     -- Move current line / block with Alt-j/k ala vscode.
--     ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
--     -- Move current line / block with Alt-j/k ala vscode.
--     ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
--     -- navigation
--     ["<A-Up>"] = "<C-\\><C-N><C-w>k",
--     ["<A-Down>"] = "<C-\\><C-N><C-w>j",
--     ["<A-Left>"] = "<C-\\><C-N><C-w>h",
--     ["<A-Right>"] = "<C-\\><C-N><C-w>l",
--   },
--
--   normal_mode = {
--     -- Better window movement
--     ["<C-h>"] = "<C-w>h",
--     ["<C-j>"] = "<C-w>j",
--     ["<C-k>"] = "<C-w>k",
--     ["<C-l>"] = "<C-w>l",
--
--     -- Move current line / block with Alt-j/k a la vscode.
--     ["<A-j>"] = ":m .+1<CR>==",
--     ["<A-k>"] = ":m .-2<CR>==",
--
--     -- QuickFix
--     ["]q"] = ":cnext<CR>",
--     ["[q"] = ":cprev<CR>",
--     ["<C-q>"] = ":call QuickFixToggle()<CR>",
--   },
--
--   term_mode = {
--     -- Terminal window navigation
--     ["<C-h>"] = "<C-\\><C-N><C-w>h",
--     ["<C-j>"] = "<C-\\><C-N><C-w>j",
--     ["<C-k>"] = "<C-\\><C-N><C-w>k",
--     ["<C-l>"] = "<C-\\><C-N><C-w>l",
--   },
map_key("v", "<", "<gv", opts)
map_key("v", ">", ">gv", opts)

--
--   visual_block_mode = {
--     -- Move current line / block with Alt-j/k ala vscode.
--     ["<A-j>"] = ":m '>+1<CR>gv-gv",
--     ["<A-k>"] = ":m '<-2<CR>gv-gv",
--   },
--
--   command_mode = {
--     -- navigate tab completion with <c-j> and <c-k>
--     -- runs conditionally
--     ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
--     ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
--   },
-- }

