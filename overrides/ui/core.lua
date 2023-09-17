local M = {}
local Helper = require "custom.overrides.ui.helper"

M.empty_string = function()
  return ""
end

M.add_space = function(module, space_length)
  local space = string.rep(" ", space_length)
  return module .. space .. ""
end

M.statusline_location = function()
  local navic = require "nvim-navic"

  if not navic.is_available() then
    return ""
  end

  local location = navic.get_location()

  location = Helper.remove_quoted_strings(location)
  location = Helper.remove_callback_string(location)
  location = Helper.trim_anonymous_function(location)
  location = Helper.concat_string(location)
  location = Helper.reduce_by_window_width(location)

  return location
end

M.statusline_lsp_status = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local clients = vim.lsp.get_active_clients()

  for _, client in ipairs(clients) do
    local current_buf = vim.api.nvim_get_current_buf()
    if client.attached_buffers[current_buf] and client.name ~= "null-ls" then
      local separator = "%#St_LspStatus_Sep#" .. ""
      local lsp_icon = "%#St_LspStatus_Icon#" .. " "
      local lsp_text = "%#St_LspStatus_Text#" .. " " .. client.name

      return (separator .. lsp_icon .. lsp_text .. " ") or " "
    end
  end
end

return M
