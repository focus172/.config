return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- LSP Support

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    }),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Esc>"] = cmp.mapping.close(),
                }
            })

            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr, remap = false, desc = "test" }

                opts.desc = "[G]o to [D]efinition";
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                opts.desc = "Show codelens";
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                opts.desc = "Show symbol in wors[S]pace";
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                opts.desc = "Open [D]iagnostics";
                vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
                opts.desc = "Next diagnostic";
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                opts.desc = "Prev diagnostic";
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                opts.desc = "[C]ode [A]ctions";
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                opts.desc = "[V]ariable [R]eferences";
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                opts.desc = "[V]ariable [R]e[N]ame";
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                opts.desc = "Get signature [HELP]";
                vim.keymap.set("n", "<leader>help", vim.lsp.buf.signature_help, opts)
            end

            -- require('lspconfig').ocamllsp.setup({
            --     filetypes = { 'ocaml' }
            -- })
        end
    },
}
