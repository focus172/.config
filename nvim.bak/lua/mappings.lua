-- ------------ --
-- mappings.lua --
-- @Focus172    --
-- ------------ --

local opts = { silent = true, noremap = false }
local km = vim.api.nvim_set_keymap

-- setting leader key and mapping it to do nothing
vim.g.mapleader = " "

-- setting key maps --
km("", "Y", "y$", opts)

-- km("", "<leader>r", ":Ex<CR>", opts)
km("", "<leader>e", ":Neotree<CR>", opts)
km("", "<leader>t", ":ToggleTerm<CR>", opts)

km("n", "<leader>s", ":w<CR>", opts)
km("n", "<leaader>q", ":q<CR>", opts)

--vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
--vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
--vim.api.nvim_set_keymap("n", "<leader>x", ':bd<CR>', opts)
--vim.api.nvim_set_keymap("n", "<leader>c", "<cmd> :lua require('Comment.api').toggle.linewise.current()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
--vim.api.nvim_set_keymap("n", "<leader>n", ":NnnPicker<CR>", opts)
--vim.api.nvim_set_keymap("n", "<leader>N", ":NnnExplorer<CR>", opts)

--vim.api.nvim_set_keymap("v", "<leader>c", "<esc><cmd> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
--vim.api.nvim_set_keymap("v", "<leader>a", ":EasyAlign<CR>", opts)

--vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<leader>q", ':lua require"dap".close()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<leader>d", ':lua require"dapui".toggle({ reset = true })<CR>', opts)
--vim.api.nvim_set_keymap("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<leader>e", ':lua require("dapui").eval()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<C-c>", ':lua require"dap".continue()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<C-s>", ':lua require"dap".step_into()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<C-o>", ':lua require"dap".step_over()<CR>', opts)
--vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", opts)
--vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", opts)
--vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", opts)
--vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", opts)
--vim.api.nvim_set_keymap("n", "<leader>t", ":TroubleToggle<CR>", opts)
