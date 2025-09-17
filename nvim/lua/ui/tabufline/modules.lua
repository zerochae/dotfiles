local M = {}

---@class NvTabLineConfig
local opts = {
  order = { "treeOffset", "buffers", "tabs" },
  bufwidth = 30,
}

local api = vim.api
local fn = vim.fn
local g = vim.g
local style_buf = require("ui.tabufline.utils").style_buf
local txt = require("ui.tabufline.utils").txt
local btn = require("ui.tabufline.utils").btn
local cur_buf = api.nvim_get_current_buf
local strep = string.rep
local nvimtree_utils = require "ui.nvim-tree.utils"

local function available_space()
  local str = ""

  for _, key in ipairs(opts.order) do
    if key ~= "buffers" then
      str = str .. M[key]()
    end
  end

  local modules = api.nvim_eval_statusline(str, { use_tabline = true })
  return vim.o.columns - modules.width
end

M.treeOffset = function()
  local w = nvimtree_utils.get_nvimtree_width()
  return w == 0 and "" or "%#NvimTreeNormal#" .. strep(" ", w) .. "%#NvimTreeWinSeparator#" .. "│"
end

function M.tabs()
  local result, tabs = "", fn.tabpagenr "$"

  if tabs > 1 then
    for nr = 1, tabs, 1 do
      local tab_hl = "TabO" .. (nr == fn.tabpagenr() and "n" or "ff")
      result = result .. btn(" " .. nr .. " ", tab_hl, "GotoTab", nr)
    end

    local new_tabtn = btn(" 󰐕 ", "TabNewBtn", "NewTab")
    local tabstoggleBtn = btn(" TABS ", "TabTitle", "ToggleTabs")
    local small_btn = btn(" 󰅁 ", "TabTitle", "ToggleTabs")

    return g.TbTabsToggled == 1 and small_btn or new_tabtn .. tabstoggleBtn .. result
  end

  return ""
end

M.buffers = function()
  local buffers = {}
  local has_current = false -- have we seen current buffer yet?

  vim.t.bufs = vim.tbl_filter(vim.api.nvim_buf_is_valid, vim.t.bufs)

  for i, nr in ipairs(vim.t.bufs) do
    if ((#buffers + 1) * opts.bufwidth) > available_space() then
      if has_current then
        break
      end

      table.remove(buffers, 1)
    end

    has_current = cur_buf() == nr or has_current
    table.insert(buffers, style_buf(nr, i, opts.bufwidth))
  end

  return table.concat(buffers) .. txt("%=", "Fill") -- buffers + empty space
end

M.btns = function()
  local toggle_theme = btn(g.toggle_theme_icon, "ThemeToggleBtn", "Toggle_theme")
  local closeAllBufs = btn(" 󰅖 ", "CloseAllBufsBtn", "CloseAllBufs")
  return toggle_theme .. closeAllBufs
end

return M
