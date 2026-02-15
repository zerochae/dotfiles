local M = {}

M.modes = {
  ["n"] = { "NORMAL", "GnNormalMode", "" },
  ["no"] = { "NORMAL (no)", "GnNormalMode", "" },
  ["nov"] = { "NORMAL (nov)", "GnNormalMode", "" },
  ["noV"] = { "NORMAL (noV)", "GnNormalMode", "" },
  ["noCTRL-V"] = { "NORMAL", "GnNormalMode", "" },
  ["niI"] = { "NORMAL i", "GnNormalMode", "" },
  ["niR"] = { "NORMAL r", "GnNormalMode", "" },
  ["niV"] = { "NORMAL v", "GnNormalMode", "" },
  ["nt"] = { "TERMINAL_OFF", "GnNTerminalMode", "" },
  ["ntT"] = { "TERMINAL (ntT)", "GnNTerminalMode", "" },

  ["v"] = { "VISUAL", "GnVisualMode", "" },
  ["vs"] = { "V-CHAR (Ctrl O)", "GnVisualMode", "" },
  ["V"] = { "V-LINE", "GnVisualMode", "" },
  ["Vs"] = { "V-LINE", "GnVisualMode", "" },
  ["\22"] = { "V-BLOCK", "GnVisualMode", "" },

  ["i"] = { "INSERT", "GnInsertMode", "" },
  ["ic"] = { "INSERT (completion)", "GnInsertMode", "" },
  ["ix"] = { "INSERT completion", "GnInsertMode", "" },

  ["t"] = { "TERMINAL", "GnTerminalMode", "" },

  ["R"] = { "REPLACE", "GnReplaceMode", "" },
  ["Rc"] = { "REPLACE (Rc)", "GnReplaceMode", "" },
  ["Rx"] = { "REPLACEa (Rx)", "GnReplaceMode", "" },
  ["Rv"] = { "V-REPLACE", "GnReplaceMode", "" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "GnReplaceMode", "" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "GnReplaceMode", "" },

  ["s"] = { "SELECT", "GnSelectMode", "" },
  ["S"] = { "S-LINE", "GnSelectMode", "" },
  ["\19"] = { "S-BLOCK", "GnSelectMode", "" },
  ["c"] = { "COMMAND", "GnCommandMode", "" },
  ["cv"] = { "COMMAND", "GnCommandMode", "" },
  ["ce"] = { "COMMAND", "GnCommandMode", "" },
  ["r"] = { "PROMPT", "GnConfirmMode", "" },
  ["rm"] = { "MORE", "GnConfirmMode", "" },
  ["r?"] = { "CONFIRM", "GnConfirmMode", "" },
  ["x"] = { "CONFIRM", "GnConfirmMode", "" },
  ["!"] = { "SHELL", "GnTerminalMode", "" },
}

M.special = {
  ["snacks_picker_list"] = { "EXPLORER", "GnExplorerMode", "" },
  ["lazygit"] = { "LAZY_GIT", "GnLazyGitMode", "" },
  ["lazy"] = { "LAZY_NVIM", "GnLazyNvimMode", "󰒲" },
  ["qf"] = { "QUICK_FIX", "GnLazyNvimMode", "" },
}

function M.get(mode_key)
  return M.modes[mode_key]
end

function M.get_special(filetype)
  return M.special[filetype]
end

function M.hl(mode_key)
  local m = M.modes[mode_key]
  return m and m[2] or "GnNormalMode"
end

function M.icon(mode_key)
  local m = M.modes[mode_key]
  return m and m[3] or ""
end

return M
