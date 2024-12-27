local overrides = require "custom.overrides.plugins"
---@type NvPluginSpec[]
local plugins = {
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    opts = {},
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
      require "custom.configs.nvim-bqf"
    end,
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    config = function()
      require "custom.configs.showkeys"
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
      require "custom.configs.helpview"
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = function()
      require "custom.configs.markview"
    end,
  },
  {
    "SmiteshP/nvim-navic",
    event = "BufEnter",
    config = function()
      dofile(vim.g.base46_cache .. "navic")
      require "custom.configs.nvim-navic"
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
      require("spectre").setup {
        replace_engine = {
          ["sed"] = {
            cmd = "sed",
            args = {
              "-i",
              "",
              "-E",
            },
          },
        },
      }
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require "custom.configs.workspaces"
    end,
  },
  {
    "zerochae/telescope-spring.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
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
      require "custom.configs.lazygit"
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require "custom.configs.diffview"
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
      require "custom.configs.hop"
    end,
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    config = function()
      require "custom.configs.noice"
    end,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "custom.configs.todo-comments"
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
      require "custom.configs.rust-tools"
    end,
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      require "custom.configs.search-replace"
    end,
    event = "BufEnter",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    ft = "dbui",
    event = "VeryLazy",
    init = function()
      require "custom.configs.vim-dadbod-ui"
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
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lspconfig"
    end,
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "folke/neodev.nvim",
        opts = {},
        config = function()
          require "custom.configs.neodev"
        end,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "custom.configs.ts-context-commentstring"
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
      require "custom.configs.nvim-ts-autotag"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = overrides.treesitter,
    dependencies = {
      "nvim-treesitter/playground",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.colorizer,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvim_cmp,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        override = overrides.devicons,
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.lspsaga"
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
      require "custom.configs.vim-visual-multi"
    end,
  },
}

return plugins
