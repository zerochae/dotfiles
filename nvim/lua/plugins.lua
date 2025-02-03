---@type LazySpec
return {
  -- {
  --   "zerochae/i18n.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = "BufReadPost",
  --   -- cmd = { "I18nRender", "I18nClear" },
  --   opts = {
  --     render = "virtual_text",
  --     default_lang = "en",
  --     locale_path = { ["wb-front-web-next"] = "packages/common/locales/" },
  --     icon = "󰗊",
  --     auto_enable = true,
  --   },
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require "configs.indent-blankline",
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    opts = {
      winfixheight = true,
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
      {
        "junegunn/fzf.vim",
        lazy = true,
      },
    },
    config = function()
      require "configs.nvim-bqf"
    end,
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    config = function()
      require "configs.showkeys"
    end,
    init = function()
      vim.cmd "ShowkeysToggle"
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  },
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "configs.helpview"
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = function()
      require "configs.markview"
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
      "nvim-tree/nvim-web-devicons",
    },
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
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require "configs.workspaces"
    end,
  },
  {
    "zerochae/branch.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Branch",

    config = function()
      require("branch").setup {}
    end,
  },

  {
    "zerochae/telescope-spring.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = {
      "SpringGetMapping",
      "SpringPostMapping",
      "SpringPutMapping",
      "SpringDeleteMapping",
    },
    config = function()
      require("spring").setup()
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
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
    -- event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
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
    "folke/todo-comments.nvim",
    config = function()
      require "configs.todo-comments"
    end,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
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
    "roobert/search-replace.nvim",
    config = function()
      require "configs.search-replace"
    end,
    event = "BufEnter",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    ft = "dbui",
    event = "VeryLazy",
    init = function()
      require "configs.vim-dadbod-ui"
    end,
    dependencies = {
      "tpope/vim-dadbod",
      {
        "kristijanhusak/vim-dadbod-completion",
        init = function()
          vim.g.completion_matching_strategy_list = { "exact", "substring" }
          vim.g.completion_matching_ignore_case = 1
        end,
      },
      "Shougo/deoplete.nvim",
      "haorenW1025/completion-nvim",
      "Shougo/ddc.vim",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "LspAttach",
    config = function()
      require "configs.null-ls"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
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
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
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
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = require "configs.treesitter",
    dependencies = {
      "nvim-treesitter/playground",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = require "configs.nvim-colorizer",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.nvim-cmp",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "configs.devicons"
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
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      require "configs.vim-visual-multi"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    enabled = false,
  },
}
