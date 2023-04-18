--
-- init.lua
--



-- loading custom plugins (with reduced functionality)
local comment = require "Comment"
local neotree = require "nvim-tree"
local telescope = require "telescope"

vim.cmd(":colorscheme habamax")

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
opt.whichwrap:append "<>[]hl"


-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.mapleader = " "

--require("lazy").setup({
--    "numToStr/Comment.nvim",
--    "nvim-tree/nvim-tree.lua",
--    "nvim-telescope/telescope.nvim",
--})


--      "           ▄ ▄                   ",
--      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
--      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
--      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
--      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
--      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
--      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
--      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
--      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",



--vim.cmd(":set background=dark")

--vim.g.terminal_color_0 = '#1c1c1c'
--vim.g.terminal_color_1 = '#d75f5f'
--vim.g.terminal_color_2 = '#87af87'
--'#afaf87'
--'#5f87af'
--'#af87af'
--'#5f8787'
--'#9e9e9e'
--'#767676'
--'#d7875f'
--'#afd7af'
--'#d7d787'
--'#87afd7'
--'#d7afd7'
--'#87afaf'
--'#bcbcbc'




-- Keybindings --
local km = vim.keymap

km.set("n", "<Leader>f", ":Ex<CR>")


-- Comment in both modes
km.set("n" , "<Leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>")
km.set("v" , "<Leader>/", "<ESC>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- save
km.set("n", "<C-s>", ":w<CR>")

--   i = {
  --   -- go to  beginning and end
  --   ["<C-b>"] = { "<ESC>^i", "beginning of line" },
  --   ["<C-e>"] = { "<End>", "end of line" },
  --
  --   -- navigate within insert mode
  --   ["<C-h>"] = { "<Left>", "move left" },
  --   ["<C-l>"] = { "<Right>", "move right" },
  --   ["<C-j>"] = { "<Down>", "move down" },
  --   ["<C-k>"] = { "<Up>", "move up" },
  -- },
  --
  -- n = {
  --   -- switch between windows
  --   ["<C-h>"] = { "<C-w>h", "window left" },
  --   ["<C-l>"] = { "<C-w>l", "window right" },
  --   ["<C-j>"] = { "<C-w>j", "window down" },
  --   ["<C-k>"] = { "<C-w>k", "window up" },
  --
  --   -- Copy all
  --   ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
  --
  --   -- new buffer
  --   ["<leader>b"] = { "<cmd> enew <CR>", "new buffer" },
  -- },


--  ┌                                                                              ┐
--  │ These define common comment styles like this                                 │
--  └                                                                              ┘
--km.set({ "n", "v" }, "<leader>x1", ":CBlbox12<cr>", { desc = "Comment - single side" })
--km.set({ "n", "v" }, "<leader>x2", ":CBlbox18<cr>", { desc = "Comment - both sides" })
--km.set("n", "<leader>x3", "CBline3<cr>", { desc = "Centered Line" })
--km.set("n", "<leader>x4", "CBline5<cr>", { desc = "Centered Line Weighted" })

--km.set("n", "<Leader>lu", ":Lazy update<CR>", { desc = "Lazy Update (Sync)" })

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

local M = {}



--
--
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




