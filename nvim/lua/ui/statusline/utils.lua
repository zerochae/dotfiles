local M = {}

local modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["no"] = { "NORMAL (no)", "St_NormalMode" },
  ["nov"] = { "NORMAL (nov)", "St_NormalMode" },
  ["noV"] = { "NORMAL (noV)", "St_NormalMode" },
  ["noCTRL-V"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["nt"] = { "TERMINAL_OFF", "St_NTerminalMode" },
  ["ntT"] = { "TERMINAL (ntT)", "St_NTerminalMode" },

  ["v"] = { "VISUAL", "St_VisualMode" },
  ["vs"] = { "V-CHAR (Ctrl O)", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },

  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },

  ["t"] = { "TERMINAL", "St_TerminalMode" },

  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rc"] = { "REPLACE (Rc)", "St_ReplaceMode" },
  ["Rx"] = { "REPLACEa (Rx)", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "St_ReplaceMode" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "St_ReplaceMode" },

  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["x"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

local special_modes = {
  ["TelescopePrompt"] = { "TELESCOPE", "St_TelescopeMode" },
  ["NvimTree"] = { "NVIM_TREE", "St_NvimTreeMode" },
  ["lazygit"] = { "LAZY_GIT", "St_LazyGitMode" },
  ["lazy"] = { "LAZY_NVIM", "St_LazyNvimMode" },
  ["qf"] = { "QUICK_FIX", "St_LazyNvimMode" },
}

M.get_special_mode = function(filetype)
  return special_modes[filetype]
end

M.get_mode = function(filetype)
  return modes[filetype]
end

M.set_mode_info = function(mode, hl)
  local hl_prefix = "%#"
  local hl_suffix = "#"
  local hl_empty = "%#ST_EmptySpace#"
  local sep = "█"
  local icon = "  "

  local current_mode = hl_prefix .. hl .. hl_suffix .. icon .. mode .. " "

  return current_mode .. hl_empty .. sep
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

M.print_with_folder = function(opts)
  local location = opts.location
  local current_path = opts.current_path
  local current_file = opts.current_file
  local path_segments = opts.path_segments
  local icon = opts.icon
  local folder_icon = "󰉋 "

  local cols = vim.opt.columns:get()

  local folder_format = "%#NavicFolderBlock# " .. folder_icon .. current_path .. " "
  if cols < 153 then
    folder_format = "%#NavicFolderBlock# " .. folder_icon .. path_segments[#path_segments] .. " "
  end

  if string.len(location) ~= 0 then
    return folder_format .. icon .. " %#NavicText#" .. current_file .. "%#NavicSeparator# > " .. location
  else
    return folder_format .. icon .. " %#NavicText#" .. current_file
  end
end

return M
