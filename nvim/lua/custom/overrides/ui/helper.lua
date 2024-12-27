local M = {}

-- 문자열이 포함된 경우 제거
M.remove_quoted_strings = function(input)
  if input:find "vue" then
    return input:gsub('"', ""):gsub(".vue", "")
  end

  return input:gsub('"(.-)"', ""):gsub("'(.-)'", "")
end

-- 'callback' 스트링 제거
M.remove_callback_string = function(input)
  return input:gsub("%(%) callback%%[*]%%#NavicSeparator# >", "%%#NavicSeparator# >"):gsub("%(%) callback%%[*]", "")
end

M.remove_html_selector = function(input)
  local newParts = {}

  for part in string.gmatch(input, "[^>]+") do
    local _, _, foundText = string.find(part, "#NavicText#(.-)%%[*]")
    if foundText then
      local remove_parts = {}
      for remove_part in input:gmatch "[^#%.]+" do
        table.insert(remove_parts, remove_part)
      end

      table.insert(newParts, remove_parts[1])
    end
  end

  return table.concat(newParts, ">")
end

-- text 길이가 긴 경우 줄이기
M.concat_string = function(input)
  local max_length = 12
  local newParts = {}
  local colmns = vim.o.columns

  if colmns > 153 and #input < 700 then
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
        part = string.gsub(part, string.gsub(foundText, "-", "%%-"), shortenedText)
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
  local colmns = vim.o.columns
  local depth_limit_indicator = "%#NavicDepthLimitIndicator# "
  local depth_limit = 4
  local input_length = #input

  if colmns < 200 or input_length > 250 then
    depth_limit = 3
  end

  if colmns < 153 or input_length > 230 then
    depth_limit = 2
  end

  if colmns < 130 then
    -- tabufline_location()
    vim.o.winbar = "   %{%v:lua.require'nvim-navic'.get_location()%}"
    return "" -- 빈 문자열 리턴
  end
  vim.o.winbar = ""

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
