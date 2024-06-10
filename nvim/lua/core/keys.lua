-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>bd", "<cmd> bd <CR> <cmd> bnext <CR>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR> ", { desc = "[N]ew [B]uffer" })

vim.keymap.set("i", "<A-j>", "<Esc> <cmd>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc> <cmd>m .-2<CR>==gi", { desc = "Move line up" })
-- ["<Esc>"] = { ":noh <CR>", "Clear highlights" },

-- Move windows using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window Left", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window Left", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window Left", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window Left", remap = true })

-- n = {
-- ["q"] = { "<nop>", "Vim macros are garbage" },
-- ["Q"] = { "<nop>", "I dont know what this does" },

-- ["<leader>n"] = { "<cmd> cnext <CR> zz", "See the next error" },

-- ["<A-j>"] = { "<cmd> m .+1<CR>==", "Move line down" },
-- ["<A-k>"] = { "<cmd> m .-2<CR>==", "Move line up" },
-- },

-- v = {
-- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
-- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
-- ["<"] = { "<gv", "Remove indent" },
-- [">"] = { ">gv", "Add indent" },

-- ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Move selection up" },
-- ["<A-k>"] = { ":m '>-2<CR>gv-gv", "Move selection up" },
-- },

-- Remaps
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open [P]roject explorer [V]iew (netrw)" })
-- vim.keymap.set("v", "Y", "\"+y", { desc = "[Y]ank to clipboard" })
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "J", "mzJ`z")                                                       -- use J to append line to end and make the cursor stay at the top
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                 -- move to next half of file without moving cursor
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")                                                       -- searching for terms keeps cursor/highlight in the middle
-- vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<leader>vs", "<C-w>v<C-w>l", { desc = "[S]plit [V]ertical pane" }) -- open a vertical on the right and switch to it (replaced by tmux)
-- vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Next buffer" })            -- go to next buffer

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
-- local Util = require("core.util")

-- better up/down
--
-- TODO: fix this
--
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
-- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
-- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set("n", "<leader>uh", "<Cmd>nohlsearch<CR>", { desc = "Clear Highlight" })

vim.keymap.set({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
-- vim.keymap.set('n', "n", "<nop>", {})
-- vim.keymap.set('n', "N", "<nop>", {})

-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })


-- if not Util.has("trouble.nvim") then
-- 	map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
-- 	map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
-- end


-- toggle options
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ul", function() Util.toggle_number() end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })

-- highlights under cursor
-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- ## buffers
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- ## windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- ## tabs
vim.keymap.set("n", "<leader><tab>y", "<cmd>tabnew<cr>", { desc = "New [y] [T]ab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "[N]ext Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "[P]revious Tab" })
-- vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })


vim.keymap.set("n", "-", "<cmd> Oil <CR>", { desc = "Edit Parent Dir" })

-- # Telelscope
vim.keymap.set("n", "<leader><space>", "<cmd> Telescope buffers <CR>", { desc = "Find [ ] buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "[F]ind [F]iles" })

-- rg
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "[F]ind [W]ord" })
-- looks for the work under your cursor + selection
vim.keymap.set("n", "<leader>fg", "<cmd> Telescope grep_string <CR>", { desc = "[F]ind [G]rep" })

vim.keymap.set("n", "<leader>p", "<cmd> Telescope registers <CR>", { desc = "[P]aste Register" })

-- return {
--     n = {
--         -- ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "[F]ind [A]ll" },
--
--         ["<leader>fH"] = { "<cmd> Telescope help_tags <CR>", "[F]ind [H]elp" },
--
--         -- finds files you have recently opend in any project
--         ["<leader>fh"] = { "<cmd> Telescope oldfiles <CR>", "[F]ind [H]istory" },
--
--         ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "[F]u[Z]zy Find" },
--
--         -- finds text within git diffs
--         -- ["<leader>fg"] = { "<cmd> Telescope git_status <CR>", "[F]ind Active [G]it" },
--
--         -- ["<leader>fG"] = { "<cmd> Telescope git_files <CR>", "[F]ind All [G]it" },
--         ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "[F]ind Git [C]ommits" },
--         -- 	{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
--         ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "[F]ind [D]iagnostics" },
--         ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "[F]ind [M]arks" },
--         ["<leader>f:"] = { "<cmd> Telescope command_history <cr>", "[F]ind [:] Command" },
--
--         -- need nvim-notify
--         ["<leader>fn"] = { "<cmd> Telescope notify <CR>", "[F]ind [N]otifications" },
--
--         -- ["<leader>uC"] = { "<cmd> Telescope colorscheme enable_preview=true", "Colorscheme" }
--     },
-- }

-- return {
-- 	{ "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
-- 	-- search
--
-- 	{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
-- 	{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
-- 	{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
-- 	{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
-- 	{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
-- 	{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
-- 	{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
-- 	{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
-- 	{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
-- 	{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
-- 	{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
-- 	{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
-- 	{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
-- 	{ "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
-- 	{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },

-- local telescope_builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pg', telescope_builtin.git_files, { desc = "[P]roject [G]it file search" })
-- vim.keymap.set('n', '<leader>ps', telescope_builtin.live_grep, { desc = "[P]roject [S]earch with grep" })
-- vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>/', function()
--     -- You can pass additional configuration to telescope to change theme, layout, etc.
--     telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--         winblend = 10,
--         previewer = false,
--     })
-- end, { desc = '[/] Search in current buffer' })
