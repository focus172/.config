local opts = {

    history = true,
    delete_check_events = "TextChanged",
}

require("luasnip").config.set_config(opts)

-- require("luasnip.loaders.from_vscode").lazy_load()
--         local paths = {}
--         require("luasnip.loaders.from_lua").lazy_load()
--         require("luasnip.loaders.from_vscode").lazy_load {
--             paths = paths,
--         }
--         require("luasnip.loaders.from_snipmate").lazy_load()

-- vscode format
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if
            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
})

-- local keys = {
--     {
--         "<tab>",
--         function()
--             return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
--         end,
--         mode = "i",
--         expr = true,
--         silent = true,
--     },
--     {
--         "<tab>",
--         function()
--             require("luasnip").jump(1)
--         end,
--         mode = "s",
--     },
--     {
--         "<s-tab>",
--         function()
--             require("luasnip").jump(-1)
--         end,
--         mode = { "i", "s" },
--     },
-- }
