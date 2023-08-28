-- [[ Load Basic Keymaps ]] --
-- also check out mappings.default
require("core.keys").load_module("general", { desc = "Core mapping" })

require("core.keys").load_module("neotree")

-- [[ Auto Commands ]] --
local function augroup(name)
    return vim.api.nvim_create_augroup("fvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
    pattern = '*',
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     group = augroup("last_loc"),
--     callback = function()
--         local exclude = { "gitcommit" }
--         local buf = vim.api.nvim_get_current_buf()
--         if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
--             return
--         end
--         local mark = vim.api.nvim_buf_get_mark(buf, '"')
--         local lcount = vim.api.nvim_buf_line_count(buf)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--     end,
-- })

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Close tabline with alpha
-- vim.api.nvim_create_autocmd("User", {
--     pattern = "AlphaReady",
--     command = "set showtabline=0 | set laststatus=0",
-- })

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'AlphaReady',
--   desc = 'disable status, tabline and cmdline for alpha',
--   callback = function()
--     vim.go.laststatus = 0
--     vim.opt.showtabline = 0
--     vim.opt.cmdheight = 0
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('BufUnload', {
--   buffer = 0,
--   desc = 'enable status, tabline and cmdline after alpha',
--   callback = function()
--     vim.go.laststatus = 3
--     vim.opt.showtabline = 2
--     vim.opt.cmdheight = 1
--   end,
-- })

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
    -- char = '┊',
    show_trailing_blankline_indent = true,
}

-- [[ Configure Harpoon]]
require('harpoon').setup({})
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[A]dd to harpoon' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Open harpoon switcher' })







-- ---@param on_attach fun(client, buffer)
-- function M.on_attach(on_attach)
--     vim.api.nvim_create_autocmd("LspAttach", {
--         callback = function(args)
--             local buffer = args.buf
--             local client = vim.lsp.get_client_by_id(args.data.client_id)
--             on_attach(client, buffer)
--         end,
--     })
-- end

-- vim.keymap.set("t", "<c-h>", "<c-h>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-j>", "<c-j>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-k>", "<c-k>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = buf, nowait = true })
