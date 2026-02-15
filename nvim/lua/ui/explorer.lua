local M = {}
local api = vim.api

function M.get_explorer_width()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.w[win].snacks_layout then
      local cfg = api.nvim_win_get_config(win)
      if cfg.relative == "" and api.nvim_win_get_position(win)[2] == 0 then
        return api.nvim_win_get_width(win)
      end
    end
  end
  return 0
end

return M
