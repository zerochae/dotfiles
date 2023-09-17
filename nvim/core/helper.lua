local M = {}

M.Add_Utf8_Header = function()
  local first_line = vim.fn.getline(1)
  if first_line ~= "SET NAMES utf8;" then
    vim.fn.setline(1, "SET NAMES utf8;")
  end
end

return M
