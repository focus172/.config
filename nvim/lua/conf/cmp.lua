-- See `:help cmp`

-- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

local cmp = require("cmp")
local luasnip = require("luasnip")

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local opts = {
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    formatting = {
        format = function(_, item)
            -- local icons = require("core.config").icons.kinds
            -- if icons[item.kind] then
            --     item.kind = icons[item.kind] .. item.kind
            -- end
            return item
        end,
    },
    window = {
        completion = {
            -- side_padding = 1, -- also can be 0 for fun
            -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
            -- scrollbar = false,
            -- border = border "CmpBorder"
        },
        documentation = {
            -- border = border "CmpDocBorder",
            -- winhighlight = "Normal:CmpDoc",
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    --         mapping = cmp.mapping.preset.insert({
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = nil, -- cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = nil, -- cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        -- ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ["<S-CR>"] = nil,

        -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<CR>'] = cmp.mapping.confirm({
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = false
        -- }),
        -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<Esc>"] = cmp.mapping.close(),
    },

    -- sources = cmp.config.sources({
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        -- { name = "crates" },
    },
    -- }),
    -- experimental = {
    --     ghost_text = {
    --         hl_group = "CmpGhostText",
    --     },
    -- },
}

cmp.setup(opts)
