return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal_cmd = "/opt/homebrew/bin/claude",
      terminal = {
        snacks_win_opts = {
          position = "float",
          width = 0.9,
          height = 0.9,
          keys = {
            claude_hide = {
              "<C-t>",
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide",
            },
          },
        },
      },
    },
    lazy = false,
    config = true,
  },
  {
    "johnseth97/gh-dash.nvim",
    keys = {
      {
        "<leader>gh",
        function()
          require("gh_dash").toggle()
        end,
        desc = "Toggle gh-dash popup",
      },
    },
    opts = {
      keymaps = {},
      border = "rounded",
      width = 0.8,
      height = 0.8,
      autoinstall = true,
    },
  },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = require "configs.kulala",
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
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
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
    opts = {
      max_recents = 30,
      use_new_command = true,
    },
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
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require "configs.workspaces"
    end,
  },
  {
    -- "zerochae/endpoint.nvim",
    dir = "~/Dev/nvim-project/endpoint.nvim",
    cmd = {
      "Endpoint",
    },
    dependencies = { "nvim-telescope/telescope.nvim", "folke/snacks.nvim" },
    opts = require "configs.endpoint",
    config = function(_, opts)
      require("endpoint").setup(opts)
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
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
}
