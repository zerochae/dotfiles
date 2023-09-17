local M = {}

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
          border = "rounded",
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
