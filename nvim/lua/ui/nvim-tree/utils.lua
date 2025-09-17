local M = {}
local api = vim.api

function M.get_nvimtree_width()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win)
    end
  end
  return 0
end

function M.float_nvim_tree_view()
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

function M.dynamic_nvim_tree_width()
  local ratio = 0.25
  local cols = vim.opt.columns:get()
  local width = math.floor(cols * ratio)

  local max_width = 35

  if cols < 130 then
    max_width = 30
  end

  return math.max(width, max_width)
end

return M
