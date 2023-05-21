---@type ChadrcConfig
local M = {}
M.ui = {
    theme = 'tokyodark',
    theme_toggle = {"tokyodark", "rosepine"},
    transparency = true,
    nvdash = {
        load_on_startup = true,
        buttons = {
            {"  Find File", "Spc f f", "Telescope find_files"},
            {"󰈚  Recent Files", "Spc f o", "Telescope oldfiles"},
            {"󰈭  Find Word", "Spc f w", "Telescope live_grep"},
            {"  Bookmarks", "Spc m a", "Telescope marks"},
            -- {"  Themes", "Spc t h", "Telescope themes"},
            {"  Mappings", "Spc c h", "NvCheatsheet"}
        }
    }
}
M.plugins = 'custom.plugins'
M.mappings = require "custom.mappings"
return M
