local overrides = require "custom.overrides.plugins"

---@type NvPluginSpec[]
local plugins = {
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   ft = "markdown",
  --   config = function()
  --     require("render-markdown").setup {}
  --   end,
  -- },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = function()
      require("markview").setup()
    end,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
          rocks = {
            hererocks = true,
            enabled = false,
          },
        },
      },
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },
    lazy = false,
    version = "v8.7.1",
    config = function()
      require "custom.configs.neorg"
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          enabled = true,
          ruler = true,
          showcmd = true,
          laststatus = 1,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = true },
        wezterm = {
          enabled = true,
          font = "24",
        },
      },
    },
    event = "VeryLazy",
    dependencies = {
      {
        "folke/twilight.nvim",
        opts = {},
      },
    },
  },
  {
    "lervag/wiki.vim",
    event = "VeryLazy",
    config = function()
      vim.g.wiki_root = "~/Dev/note/"
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
      require("spectre").setup()
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
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
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
          require "custom.configs.vim-dadbod"
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
    dependencies = {
      "petertriho/nvim-scrollbar",
    },
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
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
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
