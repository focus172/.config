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

local rosepine = {
  "rose-pine/neovim",
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "rose-pine"
  end,
}

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "gruvbox"
  end,
}

return {

  -- selecting a colorscheme here (none for defualt terminal scheme)
  
  --catppuccin,
  --tokyonight,
  gruvbox,
  --rosepine,

  {
    "williamboman/mason.nvim",
    name = "mason",
    lazy = false, -- as per github recommendation
    config = function()
      require("plugin_config.mason")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    -- lazy = true,
    config = function()
      require("plugin_config.treesitter") 
    end,
    -- cmd = "TSUpdate"

  },

  {
    "folke/which-key.nvim",
    name = "which-key",
    -- lazy = true,
    config = function()
      -- todo
    end,
  },
 
  {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neo-tree",
    -- lazy = true,
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- require
    end
  },

  {
    "akinsho/toggleterm.nvim",
    name = "toggleterm",
    config = function()
      require("plugin_config.toggleterm")
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent_blankline",
    config = function()
      require("plugin_config.indent")
    end,
  },

  {
    "folke/noice.nvim", -- cmdline popup and cool things
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
  },

  {
    "github/copilot.vim",
    name = "copilot",
  },


  --[[
  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- custom config that will be executed when loading the plugin
    config = function()
      require("neorg").setup()
    end,
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
  --]]

  -- I have not gotten this to work but should be loaded at the top for best effect
  --[[ {
    "lewis6991/impatient.nvim",
    name = "impatient",
    cmd = "lua require('impatient')"
  },
  --]]
}
