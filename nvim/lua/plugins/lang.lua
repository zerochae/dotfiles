return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = require "configs.treesitter",
    dependencies = {
      "nvim-treesitter/playground",
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "configs.ts-context-commentstring"
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    config = function()
      require "configs.nvim-ts-autotag"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = "rs",
    config = function()
      require "configs.rust-tools"
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
      require "configs.markview"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "davidmh/mdx.nvim",
    event = "BufEnter *.mdx",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}