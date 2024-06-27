local M = {}

vim.g.navic_silence = true
vim.b.navic_lazy_update_context = true

local function remove_callback_string(input)
  return input:gsub("%(%) callback%%[*]%%#NavicSeparator# >", "%%#NavicSeparator# >"):gsub("%(%) callback%%[*]", "")
end

local function remove_quoted_strings(input)
  if input:find "vue" then
    return input:gsub('"', ""):gsub(".vue", "")
  end

  return input:gsub("%b()", "")
end

local function reduce_by_window_width(input)
  local colmns = vim.o.columns
  local depth_limit_indicator = "%#NavicDepthLimitIndicator#.."
  local depth_limit = 4
  local input_length = #input

  if colmns > 180 then
    return input
  end

  if colmns < 200 or input_length > 250 then
    depth_limit = 3
  end

  if colmns < 153 or input_length > 230 then
    depth_limit = 2
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

M.directory = function()
  local current_path = vim.fn.expand "%:.:h"

  if string.len(current_path) == 0 then
    return ""
  end

  local segments = {}
  for segment in string.gmatch(current_path, "[^/]+") do
    table.insert(segments, segment)
  end

  if #segments > 4 then
    current_path = "../"
    for i, segment in ipairs(segments) do
      if i == #segments then
        current_path = current_path .. segment
      elseif i > #segments - 3 then
        current_path = current_path .. segment .. "/"
      end
    end
  end

  local separator = "%#St_Folder_Sep#" .. "█"
  local folder_icon = "%#St_Folder_Icon#" .. " "
  local folder_text = "%#St_Folder_Text#" .. " " .. current_path

  return (separator .. folder_icon .. folder_text .. " ") or " "
end

M.get_location = function()
  local root = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local current_path = vim.fn.expand "%:.:h"
  local current_file = vim.fn.expand "%:t"
  local folder_icon = "󰉋 "

  if not current_file then
    return " "
  end

  local devicons_present, devicons = pcall(require, "nvim-web-devicons")
  local icon

  if not devicons_present then
    return " "
  end

  local ft_icon, ft_hi = devicons.get_icon(current_file)

  if not ft_icon or not ft_hi then
    return " "
  end

  icon = "%#" .. ft_hi .. "# " .. ft_icon

  local navic_present, navic = pcall(require, "nvim-navic")

  if not navic_present then
    return " "
  end

  local location = navic.get_location()

  if not location then
    return " "
  end

  if current_path == "." then
    current_path = root
  end

  local path_segments = vim.fn.split(current_path, "/")

  if string.len(current_path) > 0 then
    if #path_segments > 3 then
      current_path = "../" .. table.concat(path_segments, "/", #path_segments - 2, #path_segments)
    end
  end

  local cols = vim.opt.columns:get()

  local folder_format = "%#NavicFolderBlock# " .. folder_icon .. current_path .. " "
  if cols < 153 then
    folder_format = "%#NavicFolderBlock# " .. folder_icon .. path_segments[#path_segments] .. " "
  end

  -- local hi_separator = "%#St_LineAndColumn_Sep#" .. "█"
  -- local hi_icon = "%#St_LineAndColumn_Icon#" .. folder_icon
  -- local hi_text = "%#St_LineAndColumn_Text#" .. " " .. current_path
  -- local folder_format = hi_separator .. hi_icon .. hi_text .. " "

  location = reduce_by_window_width(location)
  location = remove_quoted_strings(location)
  location = remove_callback_string(location)

  if string.len(location) ~= 0 then
    return folder_format .. icon .. " %#NavicText#" .. current_file .. "%#NavicSeparator# > " .. location
  else
    return folder_format .. icon .. " %#NavicText#" .. current_file
  end
end

M.set_navic = function(args)
  local navic_present, navic = pcall(require, "nvim-navic")

  if not navic_present then
    return
  end

  local bufnr = args.buf

  if not navic.is_available(bufnr) then
    return
  end

  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  if filetype == "NvimTree" then
    vim.wo.winbar = "%#WinbarEmpty# "
    return
  end

  local buf_name = vim.api.nvim_buf_get_name(0)
  if buf_name ~= "" then
    vim.wo.winbar = "%{%v:lua.require('custom.overrides.ui.navic').get_location()%}"
  else
    vim.wo.winbar = "%#WinbarEmpty# "
  end
end

return M
