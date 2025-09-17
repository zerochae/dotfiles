return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {},
        config = function()
          require "configs.neodev"
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "configs.lspsaga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.nvim-cmp",
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require "configs.tiny-inline-diagnostic"
    end,
  },
}