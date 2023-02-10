local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false, 
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "tokyonight"
  end,
}

return {

  -- selecting a colorscheme here
  catppuccin,
  --tokyonight,

  {
    "williamboman/mason.nvim",
    name = "mason",
    lazy = false, -- as per github recommendation
    config = function()
      require("plugin_config.mason")
    end,
  }

  --[[
  -- I have a separate config.mappings file where I require which-key.
  -- With lazy the plugin will be automatically loaded when it is required somewhere
  {
    "folke/which-key.nvim",
    lazy = true
  },
  
  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- custom config that will be executed when loading the plugin
    config = function()
      require("neorg").setup()
    end,
  },

  -- or set custom options:
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = { foo = "bar" }, -- run require("neorg").setup({foo = "bar"})
  },

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  {
    "cshuaimin/ssr.nvim",
    -- init is always executed during startup, but doesn't load the plugin yet.
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>cR", function()
        -- this require will automatically load the plugin
        require("ssr").open()
      end, { desc = "Structural Replace" })
    end,
  },

  {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = {
      "<C-a>", { "<C-x>", mode = "n" }
    },
  },

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
          -- add any options here
      })
    end,
    requires = {
      -- "MunifTanjim/nui.nvim", -- don't know why this is required
      -- "rcarriga/nvim-notify", -- only required for notifications
    }
  },
  --]]
}