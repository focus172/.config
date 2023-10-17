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
	local default = require("keys.default")
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
-- @type mode "n"|"i"|"v"|table
-- @type keys string
-- @type val string|function
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

	-- if val then
	vim.keymap.set(mode, key, val, opt)
	-- else
	-- pcall(vim.api.nvim_del_keymap, mode, key)
	-- end
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps, opts)
	if mode == "multi" then
		-- test
		for k, v in pairs(keymaps) do
			local multimode = v[2].mode
			v[2].mode = nil
			M.set_keymaps(multimode, k, v, opts)
		end
	else
		for k, v in pairs(keymaps) do
			M.set_keymaps(mode, k, v, opts)
		end
	end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps, opts)
	for mode, mapping in pairs(keymaps or {}) do
		M.load_mode(mode, mapping, opts)
	end
end

-- Load a keymappings module adding the given options to each mapping
function M.load_module(name, opts)
	vim.schedule(function()
		M.load(require("keys." .. name), opts)
	end)
end

-- Returns a set of keys extended with the given opts
-- @param name the name of the plugins whos keys need to be added
-- @param opts a set of options to be merged into the keymaps
-- @type name string
-- @type opts table
function M.get_module(name, opts)
	-- return vim.tbl_map(function(tbl)
	-- 	vim.tbl_deep_extend("force", opts or {}, tbl)
	-- end, require("keys." .. name))
	return require("keys." .. name)
end

return M