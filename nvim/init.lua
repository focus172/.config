--
-- init.lua
--


-- Loading the plugin manager
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

local opt = vim.opt

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

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
opt.ruler = false

-- disable nvim intro
--opt.shortmess:append "sI"

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
-- opt.whichwrap:append "<>[]hl"


-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.mapleader = " "

require("lazy").setup({
    "numToStr/Comment.nvim",
    "nvim-tree/nvim-tree.lua",
    { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
    { "catppuccin/nvim", name = "catppuccin" },
    "nvim-lualine/lualine.nvim"
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
})

vim.cmd.colorscheme "catppuccin"

require("Comment").setup({
    -- although this claims to work in normal I disagree
    opleader = { line = '/', block = 'b/' },
    -- extra = { above = 'gcO', below = 'gco', eol = 'gcA', },
    mappings = { basic = true, extra = false }
})


local map_key = vim.api.nvim_set_keymap
local map_lua = vim.keymap.set
local opts = { silent = true, noremap = true }

local comment_api = require('Comment.api')
map_lua("n", "<leader>/", comment_api.toggle.linewise.current, {})
-- vim.cmd(":colorscheme habamax")


--      "           ▄ ▄                   ",
--      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
--      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
--      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
--      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
--      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
--      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
--      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
--      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",




-- Keybindings --

map_key("n", "<Leader>f", ":Ex<CR>", opts)



local builtin = require('telescope.builtin')
map_lua('n', '<leader>ff', builtin.find_files, {})
map_lua('n', '<leader>fg', builtin.live_grep, {})
map_lua('n', '<leader>fb', builtin.buffers, {})
map_lua('n', '<leader>fh', builtin.help_tags, {})


-- save
map_key("n", "<C-s>", ":w<CR>", opts)


-- line navigation
map_key("i", "<C-b>", "<ESC>^i", opts)
map_key("i", "<C-e>", "<End>", opts)

  --   -- navigate within insert mode
  --   ["<C-h>"] = { "<Left>", "move left" },
  --   ["<C-l>"] = { "<Right>", "move right" },
  --   ["<C-j>"] = { "<Down>", "move down" },
  --   ["<C-k>"] = { "<Up>", "move up" },

  -- normal mode widow navigation
--   ["<C-h>"] = { "<C-w>h", "window left" },
  --   ["<C-l>"] = { "<C-w>l", "window right" },
  --   ["<C-j>"] = { "<C-w>j", "window down" },
  --   ["<C-k>"] = { "<C-w>k", "window up" },



-- Copy all
map_key("n", "<C-c>", "<cmd> %y+ <CR>", opts)



-- new buffer
map_key("n", "<leader>b", "<cmd> enew <CR>", opts)




--  ┌                                                                              ┐
--  │ These define common comment styles like this                                 │
--  └                                                                              ┘

map_key("n", "<Leader>lu", ":Lazy update<CR>", opts)

--km.set("n", "<Leader>n", "<cmd>enew<CR>", { desc = "New File" })

--km.set("n", "<Leader>a", "ggVG<c-$>", { desc = "Select All" })

-- Make visual yanks place the cursor back where started
--km.set("v", "y", "ygv<Esc>", { desc = "Yank and reposition cursor" })


--km.set("n", "<leader>xu", ":UndotreeToggle<cr>", { desc = "Undo Tree" })
-- More molecular undo of text
--km.set("i", ".", ".<c-g>u")
--km.set("i", "!", "!<c-g>u")
--km.set("i", "?", "?<c-g>u")
--km.set("i", ";", ";<c-g>u")
--km.set("i", ":", ":<c-g>u")



-- n, v, i, t = mode names
--
-- M.nvimtree = {
--   n = {
--     -- toggle
--     ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
--
--     -- focus
--     ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
--   },
-- }
--
-- M.telescope = {
--   n = {
--     -- find
--     ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
--     ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
--     ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
--     ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
--     ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
--     ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
--     ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
--
--     -- git
--     ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
--     ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
--
--     -- pick a hidden term
--     ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
--
--   },
-- }




-- local o = vim.opt
-- local g = vim.g
--
-- -- Autocmds
-- vim.cmd [[
-- augroup CursorLine
--     au!
--     au VimEnter * setlocal cursorline
--     au WinEnter * setlocal cursorline
--     au BufWinEnter * setlocal cursorline
--     au WinLeave * setlocal nocursorline
-- augroup END
--
-- autocmd FileType nix setlocal shiftwidth=4
-- ]]
--
-- -- Keybinds
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)
-- map('n', '<C-n>', ':Telescope live_grep <CR>', opts)
-- map('n', '<C-f>', ':Telescope find_files <CR>', opts)
-- map('n', 'j', 'gj', opts)
-- map('n', 'k', 'gk', opts)
-- map('n', ';', ':', { noremap = true } )
--
-- g.mapleader = ' '
--
-- -- Performance
-- o.lazyredraw = true;
-- o.shell = "zsh"
-- o.shadafile = "NONE"
--
-- -- Colors
-- o.termguicolors = true
--
-- -- Undo files
-- o.undofile = true
--
-- -- Indentation
-- o.smartindent = true
-- o.tabstop = 4
-- o.shiftwidth = 4
-- o.shiftround = true
-- o.expandtab = true
-- o.scrolloff = 3
--
-- -- Set clipboard to use system clipboard
-- o.clipboard = "unnamedplus"
--
-- -- Use mouse
-- o.mouse = "a"
--
-- -- Nicer UI settings
-- o.cursorline = true
-- o.relativenumber = true
-- o.number = true
--
-- -- Get rid of annoying viminfo file
-- o.viminfo = ""
-- o.viminfofile = "NONE"
--
-- -- Miscellaneous quality of life
-- o.ignorecase = true
-- o.ttimeoutlen = 5
-- o.hidden = true
-- o.shortmess = "atI"
-- o.wrap = false
-- o.backup = false
-- o.writebackup = false
-- o.errorbells = false
-- o.swapfile = false
-- o.showmode = false
-- o.laststatus = 3
-- o.pumheight = 6
-- o.splitright = true
-- o.splitbelow = true
-- o.completeopt = "menuone,noselect"


require('lualine').setup {
  -- options = {
  --   icons_enabled = true,
  --   theme = 'auto',
  --   component_separators = { left = '', right = ''},
  --   section_separators = { left = '', right = ''},
  --   disabled_filetypes = {
  --     statusline = {},
  --     winbar = {},
  --   },
  --   ignore_focus = {},
  --   always_divide_middle = true,
  --   globalstatus = false,
  --   refresh = {
  --     statusline = 1000,
  --     tabline = 1000,
  --     winbar = 1000,
  --   }
  -- },
  -- sections = {
  --   lualine_a = {'mode'},
  --   lualine_b = {'branch', 'diff', 'diagnostics'},
  --   lualine_c = {'filename'},
  --   lualine_x = {'encoding', 'fileformat', 'filetype'},
  --   lualine_y = {'progress'},
  --   lualine_z = {'location'}
  -- },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {'location'},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  -- tabline = {},
  -- winbar = {},
  -- inactive_winbar = {},
  -- extensions = {}
}
