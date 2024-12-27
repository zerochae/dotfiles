local M = {}
local ascii = require "custom.assets.ascii"

M.nvim_tree_padding = function()
  -- local function get_nvim_tree_width()
  --   for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
  --     if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
  --       return vim.api.nvim_win_get_width(win) + 1
  --     end
  --   end
  --   return 0
  -- end
  --
  -- local nvimtree_width = get_nvim_tree_width()
  --
  -- if nvimtree_width > 0 then
  --   return "%#NvimTreeNormal#"
  --     .. (vim.g.nvimtree_side == "right" and "" or string.rep(" ", nvimtree_width - 1))
  --     .. "%#TbLinePadding# "
  -- end

  return "%#NvimTreeNormal#" .. "%#TbLinePadding#"
end

local function is_activewin()
  return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

M.empty_string = function()
  return ""
end

M.add_space_front = function(module, space_length)
  local space = string.rep(" ", space_length)
  return space .. module
end

M.add_space_back = function(module, space_length)
  local space = string.rep(" ", space_length)
  return module .. space
end

local function setModeInfo(mode, hl)
  local hl_prefix = "%#"
  local hl_suffix = "#"
  -- local hl_mode_sep = hl .. "Sep#"
  local hl_empty = "%#ST_EmptySpace#"
  local sep = "█"
  local icon = "  "

  local current_mode = hl_prefix .. hl .. hl_suffix .. icon .. mode .. " "
  -- local mode_sep = hl_prefix .. hl_mode_sep .. sep

  return current_mode .. hl_empty .. sep
end

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

local specialModes = {
  ["TelescopePrompt"] = { "TELESCOPE", "St_TelescopeMode" },
  ["NvimTree"] = { "NVIM_TREE", "St_NvimTreeMode" },
  ["lazygit"] = { "LAZY_GIT", "St_LazyGitMode" },
  ["lazy"] = { "LAZY_NVIM", "St_LazyNvimMode" },
  ["qf"] = { "QUICK_FIX", "St_LazyNvimMode" },
}

-- statusline module 1
M.mode = function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
  local m = vim.api.nvim_get_mode().mode

  if not is_activewin() then
    return ""
  end

  local specialMode = specialModes[filetype]
  if specialMode then
    return setModeInfo(specialMode[1], specialMode[2])
  end

  local mode = modes[m]
  if mode then
    return setModeInfo(mode[1], mode[2])
  end

  return ""
end

-- statusline module 2
M.fileInfo = function()
  local empty = "%#St_file_info#" .. "" .. "%#St_file_sep#"
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

  local setFileInfo = function(color, ft_icon, ft)
    local icon = " 󰈚 "
    vim.cmd("hi St_file_info_icon guifg=" .. color)
    icon = "%#St_file_info_icon#" .. " " .. ft_icon

    -- if ft == "rust" then
    --   ft = "%#St_file_info#" .. "  " .. ft
    -- else
    ft = "%#St_file_info#" .. " " .. ft
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
    return setFileInfo(ft_color, ft_icon, filetype)
  end

  local filename = vim.api.nvim_buf_get_name(buf)
  local fn_icon, fn_color = devicons.get_icon_color(filename)

  if fn_icon and fn_color then
    return setFileInfo(fn_color, fn_icon, filetype)
  end

  return empty
end

-- statusline module 3
M.git = function()
  if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
    return ""
  end

  local git_status = vim.b[stbufnr()].gitsigns_status_dict
  local icon_hl = "%#St_gitIcons#"
  local text_hl = "%#St_gitText#"
  local branch_icon = ""
  local branch_name = git_status.head

  if branch_name == nil or branch_name == "" then
    return ""
  end

  return "  " .. icon_hl .. branch_icon .. " " .. text_hl .. branch_name .. " "
end

-- statusline module 7
M.LSP_Diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.INFO })

  local error_text = (errors and errors > 0) and ("%#St_lspError#" .. " " .. errors .. " ") or ""
  local warning_text = (warnings and warnings > 0) and ("%#St_lspWarning#" .. " " .. warnings .. " ") or ""
  local hint_text = (hints and hints > 0) and ("%#St_lspHints#" .. "󰛩 " .. hints .. " ") or ""
  local info_text = (info and info > 0) and ("%#St_lspInfo#" .. "󰋼 " .. info .. " ") or ""

  return "%=" .. error_text .. warning_text .. hint_text .. info_text
end

local function replace_number_to_ic(text)
  return text:gsub("%d", {
    ["1"] = "󰬺",
    ["2"] = "󰬻",
    ["3"] = "󰬼",
    ["4"] = "󰬽",
    ["5"] = "󰬾",
    ["6"] = "󰬿",
    ["7"] = "󰭀",
    ["8"] = "󰭁",
    ["9"] = "󰭂",
    ["0"] = "",
  })
end

M.line_and_column = function()
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

M.line_and_column_v2 = function(module)
  local current_line = vim.fn.line "."
  local current_colmn = vim.fn.col "."

  local text = current_line .. ":" .. current_colmn
  return module .. ((text .. " ") or " ")
end

-- statusline module 8
M.lsp = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local clients = vim.lsp.get_active_clients()

  for _, client in ipairs(clients) do
    local current_buf = vim.api.nvim_get_current_buf()

    if client.attached_buffers[current_buf] and client.name ~= "null-ls" then
      -- local separator = "%#St_LspStatus_Sep#" .. "█"
      local lsp_icon = "%#St_LspStatus_Icon#" .. " 󰚗 "
      local lsp_text = "%#St_LspStatus_Text#" .. " " .. client.name

      -- return (separator .. lsp_icon .. lsp_text .. " ") or " "
      return (lsp_icon .. lsp_text .. " ") or " "
    end
  end
end

M.bufferlist = function(module)
  return module:gsub(" 󰅖 ", "  ")
end

M.lsp_loader = function()
  if not rawget(vim, "lsp") or vim.lsp.status or not is_activewin() then
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

M.dashboard_header = function()
  -- local height = vim.api.nvim_win_get_height(0)

  -- if height < 20 then
  --   return ascii.gray_nvim.gray_nvim_future
  -- end

  -- return ascii.gray_nvim.gray_nvim_ansi_shadow_vertical
  -- return ascii.gray_nvim.gray_nvim_calvin
  -- return ascii.gray_nvim.gray_nvim_future
  return ascii.neovim.n
  -- return ascii.neovim.vim
end

return M
