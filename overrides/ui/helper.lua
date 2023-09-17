local M = {}

-- 문자열이 포함된 경우 제거
M.remove_quoted_strings = function(input)
  return input:gsub('"(.-)"', ""):gsub("'(.-)'", "")
end

-- 'callback' 스트링 제거
M.remove_callback_string = function(input)
  return input:gsub("callback", "")
end

-- text 길이가 긴 경우 줄이기
M.concat_string = function(input)
  local max_length = 12
  local newParts = {}
  local current_win = vim.api.nvim_get_current_win()
  local win_width = vim.fn.winwidth(current_win)

  if win_width > 153 then
    return input
  end

  for part in string.gmatch(input, "[^>]+") do
    local _, _, foundText = string.find(part, "#NavicText#(.-)%%[*]")
    if foundText then
      foundText = foundText:match "^%s*(.-)%s*$"
      if #foundText <= max_length then
        table.insert(newParts, part)
      else
        local shortenedText = string.sub(foundText, 1, max_length - 2) .. ".."
        part = string.gsub(part, foundText, shortenedText):gsub("[()]", "")
        table.insert(newParts, part)
      end
    else
      table.insert(newParts, part)
    end
  end

  return table.concat(newParts, ">")
end

M.trim_anonymous_function = function(input)
  return input
    :gsub("Function#󰊕 %%[*]%%#NavicText# %%[*]", "Function#󰊕%%*%%#NavicText#%%*")
    :gsub("Function#󰊕 %%[*]%%#NavicText#%%[*]", "Function#󰊕%%*%%#NavicText#%%*")
end

-- window width에 따라 indicator
M.reduce_by_window_width = function(input)
  local current_win = vim.api.nvim_get_current_win()
  local window_width = vim.api.nvim_win_get_width(current_win)
  local depth_limit_indicator = "%#NavicDepthLimitIndicator# "
  local depth_limit = 4
  local input_length = #input

  if window_width < 200 or input_length > 250 then
    depth_limit = 3
  end

  if window_width < 153 or input_length > 230 then
    depth_limit = 2
  end

  if window_width < 120 then
    return "" -- 빈 문자열 리턴
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
  return (separator .. "%#NavicSeparator#" .. ">" .. "%*" .. result) or input
end

return M
