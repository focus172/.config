local M = {}

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

-- vim.keymap.set("t", "<c-h>", "<c-h>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-j>", "<c-j>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-k>", "<c-k>", { buffer = buf, nowait = true })
-- vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = buf, nowait = true })

M.load_mappings = function(plugin_name, opts)
    vim.schedule(function()
        local function set_section_map(mode, mappings)
            for key, data in pairs(mappings) do
                if type(data[2]) == "string" then
                    local newopts = opts or {}
                    newopts.desc = data[2]
                else
                    -- opts = data[2]
                end
                vim.keymap.set(mode, key, data[1], opts)
            end
        end

        local mappings = require("mappings." .. plugin_name)

        for mode, mapping in pairs(mappings) do
            set_section_map(mode, mapping)
        end
    end)
end

return M
