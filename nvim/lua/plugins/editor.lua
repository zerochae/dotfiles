return {
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      dofile(vim.g.base46_cache .. "hop")
      require "configs.hop"
    end,
    event = "VeryLazy",
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      require "configs.search-replace"
    end,
    event = "BufEnter",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "grapp-dev/nui-components.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
    },
    event = "VeryLazy",
    config = function()
      require "configs.spectre"
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      require "configs.vim-visual-multi"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "configs.todo-comments"
    end,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}