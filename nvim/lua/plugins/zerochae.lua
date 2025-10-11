return {
  {
    -- "zerochae/endpoint.nvim",
    dir = "~/Dev/nvim-project/endpoint.nvim",
    cmd = {
      "Endpoint",
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
    },
    opts = require "configs.endpoint",
  },
  {
    dir = "~/Dev/nvim-project/devcon.nvim",
    cmd = { "DevConStart", "DevConStop", "DevConToggle", "DevConStatus", "DevConExec" },
    opts = {
      debug = true,
      ui = {
        window = {
          position = "right",
          width = 100,
        },
      },
      browser = {
        type = "chrome", -- chrome, edge, chromium, arc
        url = "http://localhost:4000",
      },
    },
  },
}
