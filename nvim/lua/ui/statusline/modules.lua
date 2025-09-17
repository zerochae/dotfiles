local M = {}
local strep = string.rep
local utils = require "ui.statusline.utils"
local nvimtree_utils = require "ui.nvim-tree.utils"
local opts = nil

local function set_opts()
  if opts then
    return opts
  end

  vim.defer_fn(function()
    opts = require("nvconfig").ui.statusline
  end, 0)
end

set_opts()

M.tree_off_set = function()
  local w = nvimtree_utils.get_nvimtree_width()
  return w == 0 and "" or "%#NvimTreeNormal#" .. strep(" ", w) .. "%#NvimTreeWinSeparator#" .. "│"
end

M.mode = function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
  local m = vim.api.nvim_get_mode().mode

  if not utils.is_activewin() then
    return "%="
  end

  local specialMode = utils.get_special_mode(filetype)

  if specialMode then
    return utils.set_mode_info(specialMode[1], specialMode[2])
  end

  local mode = utils.get_mode(m)

  if mode then
    return utils.set_mode_info(mode[1], mode[2])
  end

  return ""
end

M.filetype = function()
  local empty = "%#St_file#" .. "" .. "%#St_file_sep#"
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

  local set_file_info = function(color, ft_icon, ft)
    local icon = " 󰈚 "
    vim.cmd("hi St_file_icon guifg=" .. color .. "")
    icon = "%#St_file_icon#" .. " " .. ft_icon

    -- if ft == "rust" then
    --   ft = "%#St_file_info#" .. "  " .. ft
    -- else
    ft = "%#St_file#" .. " " .. ft
    -- end

    if icon ~= "" then
      return icon .. ft .. " " .. "%#St_file_sep#"
    end
  end

  if filetype == "" or filetype == nil or filetype == "terminal" then
    return empty
  end

  local devicons_present, devicons = pcall(require, "nvim-web-devicons")

  if not devicons_present then
    return empty
  end

  local ft_icon, ft_color = devicons.get_icon_color_by_filetype(filetype)

  if ft_icon and ft_color then
    return set_file_info(ft_color, ft_icon, filetype)
  end

  local filename = vim.api.nvim_buf_get_name(buf)
  local fn_icon, fn_color = devicons.get_icon_color(filename)

  if fn_icon and fn_color then
    return set_file_info(fn_color, fn_icon, filetype)
  end

  return empty
end

M.git_branch = function()
  if not vim.b[utils.stbufnr()].gitsigns_head or vim.b[utils.stbufnr()].gitsigns_git_status then
    return "%="
  end

  local git_status = vim.b[utils.stbufnr()].gitsigns_status_dict
  local icon_hl = "%#St_git_icons#"
  local text_hl = "%#St_git_text#"
  local branch_icon = ""
  local branch_name = git_status.head

  if branch_name == nil or branch_name == "" then
    return "%="
  end

  return "  " .. icon_hl .. branch_icon .. " " .. text_hl .. branch_name .. " "
end

M.git_diff = function()
  local git_status = vim.b[utils.stbufnr()].gitsigns_status_dict
  if not git_status then
    return ""
  end

  local git_icon = {
    add = "",
    change = "",
    delete = "",
  }

  local parts = {}
  if git_status.added and git_status.added > 0 then
    table.insert(parts, string.format("%%#GitSignsAdd#%s %d", git_icon.add, git_status.added))
  end
  if git_status.changed and git_status.changed > 0 then
    table.insert(parts, string.format("%%#GitSignsChange#%s %d", git_icon.change, git_status.changed))
  end
  if git_status.removed and git_status.removed > 0 then
    table.insert(parts, string.format("%%#GitSignsDelete#%s %d", git_icon.delete, git_status.removed))
  end

  if #parts == 0 then
    return ""
  end

  return "%*[" .. table.concat(parts, " ") .. "%*]"
end

M.diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.INFO })

  local error_text = (errors and errors > 0) and ("%#St_lspError#" .. " " .. errors .. " ") or ""
  local warning_text = (warnings and warnings > 0) and ("%#St_lspWarning#" .. " " .. warnings .. " ") or ""
  local hint_text = (hints and hints > 0) and ("%#St_lspHints#" .. "󰛩 " .. hints .. " ") or ""
  local info_text = (info and info > 0) and ("%#St_lspInfo#" .. "󰋼 " .. info .. " ") or ""

  return error_text .. warning_text .. hint_text .. info_text .. " "
end

M.cursor = function()
  local current_line = vim.fn.line "."
  local current_colmn = vim.fn.col "."

  local line_text = "" .. current_line
  local colmn_text = "" .. current_colmn

  -- local separator = "%#St_LineAndColumn_Sep#" .. "█"
  local icon = "%#St_LineAndColumn_Icon#" .. "  "
  local text = "%#St_LineAndColumn_Text#" .. " " .. line_text .. ":" .. colmn_text
  -- return (icon .. replace_number_to_ic(text) .. " ") or " "
  return (icon .. text .. " ") or " "
end

M.lsp = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    local current_buf = vim.api.nvim_get_current_buf()

    if client.attached_buffers[current_buf] and client.name ~= "eslint" and client.name ~= "tailwindcss" then
      -- local separator = "%#St_LspStatus_Sep#" .. "█"
      local lsp_icon = "%#St_LspStatus_Icon#" .. " 󰚗 "
      local lsp_text = "%#St_LspStatus_Text#" .. " " .. client.name

      -- return (separator .. lsp_icon .. lsp_text .. " ") or " "
      return (lsp_icon .. lsp_text .. " ") or " "
    end
  end
end

M.lsp_loader = function()
  if not rawget(vim, "lsp") or vim.lsp.status or not utils.is_activewin() then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  if Lsp.name == "jdtls" then
    return ""
  end

  local msg = Lsp.message
  local title = Lsp.title
  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  -- local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s ", spinners[frame + 1], title, msg)

  return "%=" .. (("%#St_LspProgress#" .. content) or " ")
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

M.get_location_v2 = function()
  local function get_file_icon(ft_hi, ft_icon)
    return "%#" .. ft_hi .. "# " .. ft_icon
  end

  local current_file = vim.fn.expand "%:t"

  if not current_file then
    return " "
  end

  local devicons_present, devicons = pcall(require, "nvim-web-devicons")

  if not devicons_present then
    return " "
  end

  local ft_icon, ft_hi = devicons.get_icon(current_file)

  if not ft_icon or not ft_hi then
    return " "
  end

  local file_icon = get_file_icon(ft_hi, ft_icon)

  local navic_present, navic = pcall(require, "nvim-navic")

  if not navic_present then
    return " "
  end

  local location = navic.get_location()

  if not location then
    return " "
  end

  local nvimtree_width = nvimtree_utils.get_nvimtree_width()

  location = utils.remove_module_segment_in_vue(location)
  location = utils.remove_class_name(location)
  location = utils.reduce_by_window_width(location)
  location = utils.remove_quoted_strings(location)
  location = utils.remove_callback_string(location)

  if nvimtree_width ~= 0 then
    return file_icon .. " %#NavicText#" .. current_file .. "%#NavicText#"
  end

  if #location ~= 0 then
    return file_icon .. " %#NavicText#" .. current_file .. "%#NavicSeparator# > " .. location .. "%#NavicText#"
  end

  return file_icon .. " %#NavicText#" .. current_file .. "%#NavicText#"
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

  -- local cols = vim.opt.columns:get()

  -- local folder_format = "%#NavicFolderBlock# " .. folder_icon .. current_path .. " "
  -- if cols < 153 then
  -- folder_format = "%#NavicFolderBlock# " .. folder_icon .. path_segments[#path_segments] .. " "
  -- end

  local hi_separator = "%#St_LineAndColumn_Sep#" .. "█"
  local hi_icon = "%#St_LineAndColumn_Icon#" .. folder_icon
  local hi_text = "%#St_LineAndColumn_Text#" .. " " .. current_path
  local folder_format = hi_separator .. hi_icon .. hi_text .. " "

  location = utils.remove_module_segment_in_vue(location)
  location = utils.remove_class_name(location)
  location = utils.reduce_by_window_width(location)
  location = utils.remove_quoted_strings(location)
  location = utils.remove_callback_string(location)

  if string.len(location) ~= 0 then
    -- return folder_format
    --   .. icon
    --   .. " %#NavicText#"
    --   .. current_file
    --   .. "%#NavicSeparator# > "
    --   .. location
    --   .. "%#NavicText#"
    return icon .. " %#NavicText#" .. current_file .. "%#NavicSeparator# > " .. location .. "%#NavicText#"
  else
    return icon .. " %#NavicText#" .. current_file .. "%#NavicText#"
    -- return folder_format .. icon .. " %#NavicText#" .. current_file .. "%#NavicText#"
  end
end

M.qf = function()
  local query = vim.g.qf_query

  if not query then
    return ""
  end

  -- 아이콘 설정 (Nerd Font 사용)
  local icon = "󰓇" -- 원하는 Nerd Font 아이콘 코드로 변경
  local icon_hl = "%#St_qf_icons#" -- 아이콘 하이라이트
  local text_hl = "%#St_qf_text#" -- 텍스트 하이라이트

  -- 아이콘과 텍스트 조합
  return icon_hl .. icon .. " " .. text_hl .. query
end

return M
