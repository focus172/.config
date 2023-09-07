-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

return {
    i = {
        ["<A-j>"] = { "<Esc> <cmd>m .+1<CR>==gi", "Move line down" },
        ["<A-k>"] = { "<Esc> <cmd>m .-2<CR>==gi", "Move line up" },

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "Move left" },
        ["<C-l>"] = { "<Right>", "Move right" },
        ["<C-j>"] = { "<Down>", "Move down" },
        ["<C-k>"] = { "<Up>", "Move up" },
    },

    n = {
        -- ["<Esc>"] = { ":noh <CR>", "Clear highlights" },

        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },

        -- save
        ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

        -- Copy all
        ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },

        -- new buffer
        ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },

        ["q"] = { "<nop>", "Vim macros are garbage" },
        ["Q"] = { "<nop>", "I dont know what this does" },

        ["<leader>n"] = { "<cmd> cnext <CR> zz", "See the next error" },

        ["<A-j>"] = { "<cmd> m .+1<CR>==", "Move line down" },
        ["<A-k>"] = { "<cmd> m .-2<CR>==", "Move line up" },

    },

    v = {
        -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["<"] = { "<gv", "Remove indent" },
        [">"] = { ">gv", "Add indent" },

        ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Move selection up" },
        ["<A-k>"] = { ":m '>-2<CR>gv-gv", "Move selection up" },
    },

    t = {
        ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    },

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
}
