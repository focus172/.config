local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
    i = generic_opts_any,
    n = generic_opts_any,
    v = generic_opts_any,
    x = generic_opts_any,
    c = generic_opts_any,
    o = generic_opts_any,
    t = { silent = true },
}

-- insert_mode = "i",
-- normal_mode = "n",
-- term_mode = "t",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- command_mode = "c",
-- operator_pending_mode = "o",


-- Unsets all keybindings defined in keymaps
-- @param keymaps The table of key mappings containing a list per mode (normal_mode, insert_mode, ..)
function M.clear(keymaps)
    local default = require("mappings.default")
    for mode, mappings in pairs(keymaps) do
        for key, _ in pairs(mappings) do
            -- some plugins may override default bindings that the user hasn't manually overriden
            if default[mode][key] ~= nil or (default[mode] ~= nil and default[mode][key] ~= nil) then
                pcall(vim.api.nvim_del_keymap, mode, key)
            end
        end
    end
end

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val, opts)
    local opt = generic_opts[mode] or generic_opts_any
    vim.tbl_extend("force", opt, opts or {})

    if type(val) == "table" then
        if type(val[2]) == "table" then
            vim.tbl_extend("force", opt, val[2])
        end

        if type(val[2]) == "string" then
            opt.desc = val[2]
        end

        val = val[1]
    end

    if val then
        vim.keymap.set(mode, key, val, opt)
    else
        pcall(vim.api.nvim_del_keymap, mode, key)
    end
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps, opts)
    for k, v in pairs(keymaps) do
        M.set_keymaps(mode, k, v, opts)
    end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps, opts)
    keymaps = keymaps or {}
    for mode, mapping in pairs(keymaps) do
        M.load_mode(mode, mapping, opts)
    end
end

-- Load a keymappings module adding the given options to each mapping
function M.load_module(name, opts)
    vim.schedule(function()
        M.load(require("mappings." .. name), opts)
    end)
end

return M
