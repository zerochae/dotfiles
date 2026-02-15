return {
  { "nvim-lua/plenary.nvim", lazy = false },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {
      ui = {
        default_winbar_panes = { "body", "headers", "headers_body", "verbose" },
        icons = {
          inlay = {
            loading = "",
            done = "",
            error = "󰈸",
          },
        },
      },
    },
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = { winfixheight = true },
  },
  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    opts = {
      max_recents = 30,
      use_new_command = true,
    },
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
