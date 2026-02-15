local M = {}
local api = vim.api
local utils = require "ui.bufline.utils"
local mode = require "ui.mode"
local config = require "grayrc"

local align = config.bufline and config.bufline.align or "left"
local is_block = config.style == "block"

function M.render()
  local bufs = vim.tbl_filter(api.nvim_buf_is_valid, vim.t.bufs or {})
  vim.t.bufs = bufs
  local cur_buf = api.nvim_get_current_buf()
  if not vim.tbl_contains(bufs, cur_buf) then
    cur_buf = vim.t.last_buf or (bufs[1] or cur_buf)
  end

  local buf_parts = {}
  for _, nr in ipairs(bufs) do
    buf_parts[#buf_parts + 1] = utils.render_buf(nr, nr == cur_buf)
  end

  local tabpages = api.nvim_list_tabpages()
  local tab_parts = {}
  local cur_tab = api.nvim_get_current_tabpage()
  for _, tabid in ipairs(tabpages) do
    local nr = api.nvim_tabpage_get_number(tabid)
    tab_parts[#tab_parts + 1] = utils.render_tab(nr, tabid == cur_tab)
  end

  local buffers = table.concat(buf_parts)
  local tabs = table.concat(tab_parts)

  local prefix = ""
  if not is_block then
    local hl = mode.hl(api.nvim_get_mode().mode)
    prefix = "%#" .. hl .. "# "
  end

  if align == "center" then
    return prefix .. "%#GnTabFill#%=" .. buffers .. "%#GnTabFill#%=" .. tabs
  elseif align == "right" then
    return prefix .. "%#GnTabFill#%=" .. buffers .. " " .. tabs
  end

  return prefix .. buffers .. "%#GnTabFill#%=" .. tabs
end

return M
