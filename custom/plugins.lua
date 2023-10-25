local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "smoka7/hop.nvim",
    keys = {
      {
        ",",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
      {
        "S",
        function()
          require("hop").hint_char2()
        end,

        mode = { "n", "x", "o" },
      },
      {
        "t",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
        mode = { "n", "x", "o" },
      },
      {
        "T",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
        mode = { "n", "x", "o" },
      },
    },

    opts = {

      multi_windows = true,

      keys = "htnsueoaidgcrlypmbkjvx",

      uppercase_labels = true,

      -- reverse_distribution = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    opts = {
      keybindings = {
        left = "<M-h>",
        down = "<M-j>",
        up = "<M-k>",
        right = "<M-l>",
        last_active = "<M-\\>",
        next = "<M-Space>",
      },
    },
  },

  {
    "sainnhe/gruvbox-material",
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
