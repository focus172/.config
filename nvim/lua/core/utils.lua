local M = {}

M.load_plugin_mappings = function(plugin_name)
  vim.schedule(function()
    local function set_section_map(mode, mapping)
      for key, data in pairs(mapping) do
        local opts = { desc = data[2] }
        vim.keymap.set(mode, key, data[1], opts)
      end
    end

    local mappings = require("core.mappings")

    for mode, mapping in pairs(mappings[plugin_name]) do
      set_section_map(mode, mapping)
    end
  end)
end

return M
