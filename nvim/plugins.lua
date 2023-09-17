local overrides = require "custom.overrides.plugins"

---@type NvPluginSpec[]
local plugins = {

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      dofile(vim.g.base46_cache .. "hop")
      require "custom.configs.search.hop"
    end,
    event = "VeryLazy",
  },

  {
    "folke/twilight.nvim",
    opts = {},
    config = function()
      require "custom.configs.color.twilight"
    end,
    event = "VeryLazy",
  },

  {
    "folke/noice.nvim",
    config = function()
      require "custom.configs.utility.noice"
    end,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          dofile(vim.g.base46_cache .. "notify")
          require "custom.configs.utility.notify"
        end,
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require "custom.configs.comment.todo-comments"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "VeryLazy",
  },

  {
    "folke/zen-mode.nvim",
    opts = {},
    config = function()
      require "custom.configs.editing.zenmode"
    end,
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require "custom.configs.file-explorer.mini"
    end,
    event = "VeryLazy",
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      dofile(vim.g.base46_cache .. "rainbowdelimiters")
      require "custom.configs.editing.rainbowdelimiters"
    end,
    event = "VeryLazy",
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.git.diffview"
    end,
  },

  {
    "ray-x/sad.nvim",
    config = function()
      require "custom.configs.search.sad"
    end,
    dependencies = {
      {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make",
      },
    },
    event = "VeryLazy",
  },

  {
    "nvim-neotest/neotest",
    config = function()
      require "custom.configs.dubugging.neotest"
    end,
    dependencies = {
      "haydenmeade/neotest-jest",
    },
    event = "VeryLazy",
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require "custom.configs.git.neogit"
    end,
    event = "VeryLazy",
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require "custom.configs.git.git-conflict"
    end,
    event = "VeryLazy",
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    config = function()
      require "custom.configs.note.neorg"
    end,
    event = "VeryLazy",
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require "custom.configs.dubugging.dap-virtual-text"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.dubugging.dap"
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require "custom.configs.dubugging.dap-ui"
        end,
      },
    },
    event = "VeryLazy",
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "custom.configs.editing.autotag"
    end,
    event = "VeryLazy",
  },

  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "custom.configs.rust.rust-tools"
    end,
  },

  {
    "preservim/vim-markdown",
    dependencies = {
      "godlygeek/tabular",
    },
  },

  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.git.octo"
    end,
    event = "VeryLazy",
  },

  {
    "roobert/search-replace.nvim",
    config = function()
      require "custom.configs.search.search-replace"
    end,
    lazy = false,
  },

  {
    "SmiteshP/nvim-navic",
    config = function()
      dofile(vim.g.base46_cache .. "navic")
      require "custom.configs.ui.nvim-navic"
    end,
  },

  {
    "vimwiki/vimwiki",
    init = function()
      require "custom.configs.note.vimwiki"
    end,
    lazy = false,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
    init = function()
      require "custom.configs.db.vim-dadbod-ui"
    end,
    dependencies = {
      "tpope/vim-dadbod",
      {
        "kristijanhusak/vim-dadbod-completion",
        init = function()
          require "custom.configs.db.vim-dadbod"
        end,
      },
      "Shougo/deoplete.nvim",
      "haorenW1025/completion-nvim",
      "vim-denops/denops.vim",
      "Shougo/ddc.vim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lsp.lspconfig"
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = overrides.comment,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
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
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "nvim-treesitter/playground",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require "custom.configs.comment.ts-context-commentstring"
        end,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = overrides.devicons }
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.lsp.lspsaga"
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
      require "custom.configs.editing.vim-visual-multi"
    end,
  },
}

return plugins
