return {
    "epwalsh/obsidian.nvim",
    ft = "markdown",
    -- vim.keymap.set("n", "gl", "<cmd>ObsidianFollowLink<CR>", { desc = "Obsidian: Follow [L]ink" })
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "main",
                path = "~/dox",
            },
        },
        -- dir = vim.fn.expand("$XDG_DOCUMENTS_DIR"),

        -- Optional, if you keep notes in a specific subdirectory of your vault.
        notes_subdir = "notes",

        -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
        -- levels defined by "vim.log.levels.*".
        log_level = vim.log.levels.INFO,

        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "notes/dailies",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y-%m-%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil,
        },

        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 0,
        },

        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        },

        -- Where to put new notes. 
        -- "current_dir" OR "notes_subdir"
        new_notes_location = "current_dir",

        -- Optional, customize how wiki links are formatted. You can set this to one of:
        --  * "use_alias_only", e.g. '[[Foo Bar]]'
        --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
        --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
        --  * "use_path_only", e.g. '[[foo-bar.md]]'
        -- Or you can set it to a function that takes a table of options and returns a string, like this:
        wiki_link_func = "prepend_note_id",

        -- Either 'wiki' or 'markdown'.
        preferred_link_style = "wiki",

        -- Optional, boolean or a function that takes a filename and returns a boolean.
        -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
        disable_frontmatter = false,

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        -- URL it will be ignored but you can customize this behavior here.
        ---@param url string
        follow_url_func = function(url)
            vim.fn.jobstart({ "handlr", "open", url })
        end,







        -- Optional, set to true if you use the Obsidian Advanced URI plugin.
        -- https://github.com/Vinzent03/obsidian-advanced-uri
        use_advanced_uri = false,

        -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
        open_app_foreground = false,

        picker = {
            -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
            name = "telescope.nvim",
        },

        -- Optional, determines how certain commands open notes. The valid options are:
        -- 1. "current" (the default) - to always open in the current window
        -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
        -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
        open_notes_in = "current",

        -- Optional, configure additional syntax highlighting / extmarks.
        -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
        ui = {
            enable = true, -- set to false to disable all additional syntax features
            update_debounce = 200, -- update delay after a text change (in milliseconds)
            -- Define how various check-boxes are displayed
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },

        -- Specify how to handle attachments.
        attachments = {
            -- The default folder to place images in via `:ObsidianPasteImg`.
            -- If this is a relative path it will be interpreted as relative to the vault root.
            -- You can always override this per image by passing a full path to the command instead of just a filename.
            img_folder = "assets/imgs", -- This is the default
        },
    },
}
