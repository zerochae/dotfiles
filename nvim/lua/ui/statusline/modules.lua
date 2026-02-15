local M = {}
local utils = require "ui.statusline.utils"
local config = require "grayrc"
local is_block = config.style == "block"

M.mode = function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
  local m = vim.api.nvim_get_mode().mode

  if not utils.is_activewin() then
    return "%="
  end

  local specialMode = utils.get_special_mode(filetype)

  if specialMode then
    return utils.set_mode_info(specialMode[1], specialMode[2], specialMode[3])
  end

  local mode = utils.get_mode(m)

  if mode then
    return utils.set_mode_info(mode[1], mode[2], mode[3])
  end

  return ""
end

M.filetype = function()
  local empty = ""
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })

  local set_file_info = function(color, ft_icon, ft)
    local icon = " 󰈚 "
    local existing = vim.api.nvim_get_hl(0, { name = "GnFileIcon" })
    vim.api.nvim_set_hl(0, "GnFileIcon", vim.tbl_extend("force", existing, { fg = color }))
    icon = "%#GnFileIcon#" .. " " .. ft_icon

    -- if ft == "rust" then
    --   ft = "%#GnFileInfo#" .. "  " .. ft
    -- else
    ft = "%#GnFile#" .. " " .. ft
    -- end

    if icon ~= "" then
      local sep = is_block and "%#NonText#█" or ""
      return sep .. icon .. ft .. " %*"
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
  local icon_hl = "%#GnGitIcon#"
  local text_hl = "%#GnGitText#"
  local branch_icon = ""
  local branch_name = git_status.head

  if branch_name == nil or branch_name == "" then
    return "%="
  end

  return " " .. icon_hl .. branch_icon .. " " .. text_hl .. branch_name .. " %*"
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

  return "%*[" .. table.concat(parts, " ") .. "%*] %*"
end

M.diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(utils.stbufnr(), { severity = vim.diagnostic.severity.INFO })

  local error_text = (errors and errors > 0) and ("%#GnLspError#" .. " " .. errors .. " ") or ""
  local warning_text = (warnings and warnings > 0) and ("%#GnLspWarning#" .. " " .. warnings .. " ") or ""
  local hint_text = (hints and hints > 0) and ("%#GnLspHints#" .. "󰛩 " .. hints .. " ") or ""
  local info_text = (info and info > 0) and ("%#GnLspInfo#" .. "󰋼 " .. info .. " ") or ""

  return error_text .. warning_text .. hint_text .. info_text .. " %*"
end

M.cursor = function()
  local current_line = vim.fn.line "."
  local current_colmn = vim.fn.col "."

  local line_text = "" .. current_line
  local colmn_text = "" .. current_colmn

  -- local separator = "%#GnCursorIcon#" .. "█"
  local icon = "%#GnCursorIcon#" .. "  "
  local text = "%#GnCursorText#" .. (is_block and " " or "") .. line_text .. ":" .. colmn_text
  -- return (icon .. replace_number_to_ic(text) .. " ") or " "
  return icon .. text .. " %*"
end

M.lsp = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    local current_buf = vim.api.nvim_get_current_buf()

    if
      client.attached_buffers[current_buf]
      and client.name ~= "eslint"
      and client.name ~= "tailwindcss"
      and client.name ~= "biome"
    then
      -- local separator = "%#GnLspIcon#" .. "█"
      local lsp_icon = "%#GnLspIcon#" .. " 󰚗 "
      local lsp_text = "%#GnLspText#" .. " " .. client.name

      -- return (separator .. lsp_icon .. lsp_text .. " ") or " "
      return lsp_icon .. lsp_text .. " %*"
    end
  end
end

M.cwd = function()
  local name = vim.uv.cwd()
  if not name then
    return ""
  end
  name = name:match "([^/\\]+)[/\\]*$" or name
  if vim.o.columns <= 85 then
    return ""
  end
  return "%#GnCwdIcon# 󰉋 %#GnCwdText#" .. (is_block and " " or "") .. name .. " %*"
end

M.lsp_progress = function()
  local stl = require "ui.statusline"
  if not stl.state.active or vim.o.columns < 120 then
    return ""
  end

  -- https://github.com/xieyonn/spinner.nvim/blob/main/lua/spinner/pattern.lua
  local spinners = {
    "✶",
    "✸",
    "✹",
    "✺",
    "✹",
    "✷",
  }
  -- local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
  local ms = vim.uv.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local icon = spinners[frame + 1]

  local parts = {}
  if stl.state.percentage then
    table.insert(parts, stl.state.percentage .. "%%")
  end
  if stl.state.title ~= "" then
    table.insert(parts, stl.state.title)
  end
  local msg = stl.state.message:match "^(%d+/%d+)" or ""
  if msg ~= "" then
    table.insert(parts, msg)
  end

  local content = icon .. " " .. table.concat(parts, " ")
  return "%#GnLspProgress# " .. content .. " %*"
end

return M
