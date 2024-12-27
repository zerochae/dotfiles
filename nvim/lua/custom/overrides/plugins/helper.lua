local M = {}

M.telescope_dynamic_layout_strategies = function()
  local layout_strategies = require "telescope.pickers.layout_strategies"

  layout_strategies.dynamic = function(self, max_columns, max_lines, layout_config)
    if vim.o.columns > 160 then
      return layout_strategies.horizontal(self, max_columns, max_lines, layout_config)
    else
      return layout_strategies.vertical(self, max_columns, max_lines, layout_config)
    end
  end
end

M.nvim_tree_view = function()
  return {
    float = {
      enable = true,
      open_win_config = function()
        local ratio = 0.8
        local rows = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local cols = vim.opt.columns:get()
        local height = math.floor(rows * ratio)
        local width = math.floor(cols * ratio)
        local center_x = math.floor((cols - width) / 2)
        local center_y = math.floor(((vim.opt.lines:get() - height) / 2) - vim.opt.cmdheight:get())

        return {
          relative = "editor",
          border = "single",
          width = width,
          height = height,
          row = center_y,
          col = center_x,
        }
      end,
    },
  }
end

return M
