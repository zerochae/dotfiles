local present, diffview = pcall(require, "diffview")

if not present then
  return
end

diffview.setup {
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
    -- win_config = function()
    --   local config = { type = "float", relative = "editor" }
    --   local editor_width = vim.o.columns
    --   local editor_height = vim.o.lines
    --   config.width = math.min(100, editor_width)
    --   config.height = math.min(24, editor_height)
    --   config.col = math.floor(editor_width * 0.5 - config.width * 0.5)
    --   config.row = math.floor(editor_height * 0.5 - config.height * 0.5)
    --   return config
    -- end,
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
