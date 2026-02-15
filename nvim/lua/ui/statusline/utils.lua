local M = {}

local mode = require "ui.mode"

M.get_special_mode = mode.get_special
M.get_mode = mode.get

M.set_mode_info = function(mode, hl, icon)
  local hl_prefix = "%#"
  local hl_suffix = "#"
  local icon_part = icon and (icon .. " ") or ""
  local current_mode = hl_prefix .. hl .. hl_suffix .. " " .. icon_part .. mode .. " "

  return current_mode .. "%*"
end

M.is_activewin = function()
  return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

M.remove_callback_string = function(input)
  return input:gsub("%(%) callback%%[*]%%#NavicSeparator# >", "%%#NavicSeparator# >"):gsub("%(%) callback%%[*]", "")
end

M.remove_quoted_strings = function(input)
  if input:find "vue" then
    return input:gsub('"', ""):gsub(".vue", "")
  end

  return input:gsub("%b()", "")
end

M.reduce_by_window_width = function(input)
  local colmns = vim.o.columns
  local depth_limit_indicator = "%#NavicDepthLimitIndicator#.."
  local depth_limit = 3
  local input_length = #input

  if colmns > 180 then
    return input
  end

  if colmns < 200 or input_length > 250 then
    depth_limit = 2
  end

  if colmns < 153 or input_length > 230 then
    depth_limit = 1
  end

  local parts = {}

  local input_parts = vim.fn.split(input, ">")
  for i = 0, #input_parts do
    table.insert(parts, input_parts[i])
  end

  if #parts <= depth_limit then
    return input
  end

  parts = vim.list_slice(parts, #parts - depth_limit + 1, #parts)

  local separator = "%#NavicSeparator#" .. depth_limit_indicator .. " %*"
  if not parts[1] == separator then
    table.insert(parts, 1, separator)
  end
  local result = table.concat(parts, ">")
  return (separator .. "%#NavicSeparator#" .. ">" .. "%* " .. result) or input
end

M.remove_module_segment_in_vue = function(input)
  if not input:find ".vue" then
    return input
  end

  local parts = {}

  local input_parts = vim.fn.split(input, ">")
  for i = 0, #input_parts do
    table.insert(parts, input_parts[i])
  end

  table.remove(parts, 1)

  return table.concat(parts, ">"):sub(2)
end

M.remove_class_name = function(input)
  return input:gsub("(%w+)%.[%w%-%.]+", "%1")
end

return M
