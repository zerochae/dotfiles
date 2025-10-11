return {
  -- {
  --   "folke/snacks.nvim",
  --   opts = require "configs.snacks",
  --   lazy = false,
  -- },
  {
    "OXY2DEV/foldtext.nvim",
    lazy = false,
    config = function()
      require "configs.foldtext"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require "configs.indent-blankline",
  },
  {
    "folke/noice.nvim",
    config = function()
      require "configs.noice"
    end,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
    init = function()
      require("telescope").load_extension "endpoint"
    end,
  },
  {
    "SmiteshP/nvim-navic",
    event = "BufEnter",
    config = function()
      dofile(vim.g.base46_cache .. "navic")
      require "configs.nvim-navic"
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "configs.devicons"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = require "configs.nvim-colorizer",
  },
}

