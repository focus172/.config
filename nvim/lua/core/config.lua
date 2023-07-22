---@type LazyVimConfig
local M = {}

M.lazy_version = ">=9.1.0"

---@class LazyVimConfig
local defaults = {
	-- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
	---@type string|fun()
	colorscheme = function()
		require("tokyonight").load()
	end,
	-- load the default settings
	defaults = {
		autocmds = true, -- lazyvim.config.autocmds
		keymaps = true, -- lazyvim.config.keymaps
		-- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
		-- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
	},
	-- icons used by other plugins
	icons = {
		dap = {
			Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
			Breakpoint = " ",
			BreakpointCondition = " ",
			BreakpointRejected = { " ", "DiagnosticError" },
			LogPoint = ".>",
		},
		diagnostics = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		},
		git = {
			added = " ",
			modified = " ",
			removed = " ",
		},
		kinds = {
			Array = " ",
			Boolean = " ",
			Class = " ",
			Color = " ",
			Constant = " ",
			Constructor = " ",
			Copilot = " ",
			Enum = " ",
			EnumMember = " ",
			Event = " ",
			Field = " ",
			File = " ",
			Folder = " ",
			Function = " ",
			Interface = " ",
			Key = " ",
			Keyword = " ",
			Method = " ",
			Module = " ",
			Namespace = " ",
			Null = " ",
			Number = " ",
			Object = " ",
			Operator = " ",
			Package = " ",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			String = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = " ",
			Unit = " ",
			Value = " ",
			Variable = " ",
		},
	},
}

M.renames = {
	["windwp/nvim-spectre"] = "nvim-pack/nvim-spectre",
}

---@type LazyVimConfig
local options

function M.bootstrap()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
end

function M.init()
	-- delay notifications till vim.notify was replaced or after 500ms
	require("core.util").lazy_notify()

	-- load options here, before lazy init while sourcing plugin modules
	-- this is needed to make sure options will be correctly applied
	-- after installing missing plugins
	require("core.config").load("options")
	local Plugin = require("lazy.core.plugin")
	local add = Plugin.Spec.add
	Plugin.Spec.add = function(self, plugin, ...)
		if type(plugin) == "table" and M.renames[plugin[1]] then
			plugin[1] = M.renames[plugin[1]]
		end
		return add(self, plugin, ...)
	end
end

---@param opts? LazyVimConfig
function M.setup(opts)
	options = vim.tbl_deep_extend("force", defaults, opts or {})

	M.load("autocmds")
	M.load("keymaps")

	if type(M.colorscheme) == "function" then
		M.colorscheme()
	else
		vim.cmd.colorscheme(M.colorscheme)
	end
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
	require("core." .. name)
	if vim.bo.filetype == "lazy" then
		-- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
		vim.cmd([[do VimResized]])
	end
	local pattern = "LazyVim" .. name:sub(1, 1):upper() .. name:sub(2)
	vim.api.nvim_exec_autocmds("User", { pattern = pattern, modeline = false })
end

---@param range? string
function M.has(range)
	local Semver = require("lazy.manage.semver")
	return Semver.range(range or M.lazy_version):matches(require("lazy.core.config").version or "0.0.0")
end

setmetatable(M, {
	__index = function(_, key)
		if options == nil then
			return vim.deepcopy(defaults)[key]
		end
		---@cast options LazyVimConfig
		return options[key]
	end,
})

return M
