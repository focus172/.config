return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        -- local config = require("alpha.themes.theta")
        local logo = [[
⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
  ]]

        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", " " .. " Vim Config", ":e $MYVIMRC <CR>"),
            dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
            dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }
        -- for _, button in ipairs(dashboard.section.buttons.val) do
        --     button.opts.hl = "AlphaButtons"
        --     button.opts.hl_shortcut = "AlphaShortcut"
        -- end

        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 8
        return dashboard

    --     local config = require 'alpha.themes.theta'.config
    --
    --     local startify = require('alpha.themes.startify')
    --     local devicons = require('nvim-web-devicons')
    --     local lazy = require('lazy')
    --
    --     local function info_value()
    --         local total_plugins = lazy.stats().count
    --         local datetime = os.date(" %d-%m-%Y    ")
    --         local version = vim.version()
    --         local nvim_version_info = devicons.get_icon_by_filetype('vim', {})
    --             .. ' v'
    --             .. version.major
    --             .. '.'
    --             .. version.minor
    --             .. '.'
    --             .. version.patch
    --
    --         return datetime .. '⚡' .. total_plugins .. ' plugins    ' .. nvim_version_info
    --     end
    --
    --     local info = {
    --         type = 'text',
    --         val = info_value(),
    --         opts = {
    --             hl = 'comment',
    --             position = 'center',
    --         },
    --     }
    --
    --     local stats = {
    --         type = 'group',
    --         val = {
    --             { type = "padding", val = 1 },
    --             info,
    --             { type = "padding", val = 2 },
    --         },
    --         opts = {
    --             position = 'center',
    --         }
    --     }
    --
    --     -- local mru = {
    --     --     type = 'group',
    --     --     val = {
    --     --         {
    --     --             type = 'text',
    --     --             val = 'Recent files',
    --     --             opts = {
    --     --                 hl = 'SpecialComment',
    --     --                 shrink_margin = false,
    --     --                 position = 'center',
    --     --             },
    --     --         },
    --     --         { type = 'padding', val = 1 },
    --     --         {
    --     --             type = 'group',
    --     --             val = function()
    --     --                 return { startify.mru(1, vim.fn.getcwd(), 10) }
    --     --             end,
    --     --             opts = {
    --     --                 position = 'center',
    --     --             }
    --     --         },
    --     --     },
    --     --     opts = {
    --     --         position = 'center',
    --     --     },
    --     -- }
    --
    --     local dashboard = require("alpha.themes.dashboard")
    --     local buttons = {
    --         type = "group",
    --         val = {
    --             { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
    --             { type = "padding", val = 1 },
    --             dashboard.button("e", "  > New file", ":ene <BAR> startinsert<CR>"),
    --             dashboard.button("f", "  > Search file", ":Telescope find_files<CR>"),
    --             dashboard.button("t", "  > Search text", ":Telescope live_grep<CR>"),
    --             dashboard.button("r", "  > Recents", ":Telescope oldfiles<CR>"),
    --             dashboard.button("p", "  > Update", ":Lazy update<CR>"),
    --             dashboard.button("s", "  > Settings", ":e ~/.config/nvim/<CR>"),
    --             dashboard.button("q", "  > Quit", ":qa<CR>"),
    --         },
    --         position = "center",
    --     }
    --
    --     config.layout[3] = stats
    --     -- config.layout[4] = mru
    --     config.layout[6] = buttons
    --
    --     require 'alpha'.setup(config)
    --
    end,
	config = function(_, dashboard)
	    require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
    end,
}
