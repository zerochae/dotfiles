return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup {
      show_help_hints = false,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = "list",
        win_config = function()
          local ratio = 0.25
          local cols = vim.opt.columns:get()
          local col_width = math.floor(cols * ratio)
          local max_width = 45
          if cols < 153 then
            max_width = 35
          end
          local width = math.max(col_width, max_width)
          return {
            type = "split",
            width = width,
            position = "left",
          }
        end,
      },
      keymaps = {
        disable_defaults = true,
      },
      hooks = {
        diff_buf_read = function()
          vim.diagnostic.disable(0)
          vim.cmd [[IndentBlanklineDisable]]
        end,
        view_closed = function()
          vim.diagnostic.enable(0)
          vim.cmd [[IndentBlanklineEnable]]
        end,
      },
    }
  end,
}
