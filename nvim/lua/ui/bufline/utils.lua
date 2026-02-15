local M = {}
local api = vim.api

local tab_icons = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳", "󰎶", "󰎹", "󰎼", "󰽽" }

function M.hl(name)
  return "%#Gn" .. name .. "#"
end

function M.clickable(str, handler, arg)
  return "%" .. (arg or "") .. "@Gn" .. handler .. "@" .. str .. "%X"
end

function M.buf_name(bufnr)
  local path = api.nvim_buf_get_name(bufnr)
  if path == "" then
    return "No Name"
  end
  return vim.fn.fnamemodify(path, ":t")
end

function M.get_icon(name)
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if not ok then
    return "󰈙", nil
  end
  local icon, hl = devicons.get_icon(name)
  return icon or "󰈙", hl
end

function M.merge_hl(icon_hl, buf_hl)
  local hl_name = "Gn_" .. icon_hl .. "_" .. buf_hl
  local fg = api.nvim_get_hl(0, { name = icon_hl, link = false }).fg
  local bg = api.nvim_get_hl(0, { name = "Gn" .. buf_hl, link = false }).bg
  api.nvim_set_hl(0, hl_name, { fg = fg, bg = bg })
  return "%#" .. hl_name .. "#"
end

function M.render_buf(bufnr, is_current)
  local name = M.buf_name(bufnr)
  local hl = is_current and "BufOn" or "BufOff"
  local icon, icon_hl = M.get_icon(name)
  local icon_part
  if icon_hl then
    icon_part = is_current and (M.merge_hl(icon_hl, hl) .. icon) or (M.hl(hl) .. icon)
  else
    icon_part = M.hl(hl) .. icon
  end

  if not is_current then
    return M.clickable(M.hl(hl) .. " " .. icon_part .. M.hl(hl) .. " ", "GoToBuf", bufnr)
  end

  return M.clickable(M.hl(hl) .. " " .. icon_part .. M.hl(hl) .. " " .. name .. M.hl(hl) .. " ", "GoToBuf", bufnr)
end

function M.render_tab(tabnr, is_active)
  local tab_hl = is_active and "GnTabOn" or "GnTabOff"
  local buf_hl = is_active and "GnBufOn" or "GnBufOff"
  local merged = "GnTabIn" .. (is_active and "Active" or "Inactive")

  local tab_props = api.nvim_get_hl(0, { name = tab_hl, link = false })
  local buf_bg = api.nvim_get_hl(0, { name = buf_hl, link = false }).bg
  api.nvim_set_hl(0, merged, { fg = tab_props.fg, bg = buf_bg, bold = true })

  local nr_icon = tab_icons[tabnr] or tostring(tabnr)
  return M.clickable("%#" .. merged .. "# " .. nr_icon .. " ", "GotoTab", tabnr)
end

return M
