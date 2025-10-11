return {
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      require "configs.lazygit"
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require "configs.diffview"
    end,
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}

