-- Install nvim-cmp, and buffer source as a dependency
--
return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        -- snippets
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function()
                require("conf.luasnip")
            end,
        },
    },
    config = function()
        -- See `:help cmp`

        -- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local icons = require("icons")

        local opts = {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            formatting = {
                format = function(_, item)
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            },
            window = {
                completion = {},
                documentation = {},
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-d>"] = nil, -- cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = nil, -- cmp.mapping.scroll_docs(4),
                -- ["<C-e>"] = cmp.mapping.close(),
                -- ["<C-e>"] = cmp.mapping.abort(),
                ["<C-Space>"] = nil,
                ["<C-y>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<S-CR>"] = nil,
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil,
                -- ["<Esc>"] = cmp.mapping.close(),
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
            },
        }

        cmp.setup(opts)
    end,
}
