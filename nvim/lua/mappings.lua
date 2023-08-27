
local M = {}

---@param name string
---@param opts table|nil
M.load = function (name, opts)
    vim.schedule(function()
        local mappings = require("mappings." .. name)

        for mode, mapping in pairs(mappings) do
            for key, data in pairs(mapping) do
                local newopts = opts or {}

                if type(data[2]) == "string" then
                    newopts.desc = data[2]
                else
                    newopts = vim.tbl_extend("force", newopts, data[2])
                end
                vim.keymap.set(mode, key, data[1], newopts)
            end
        end
    end)
end

return M
