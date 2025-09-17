local colors = require "ui.assets.colors"

return {
  override = {
    -- default
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Search = { bg = colors.magenta, fg = colors.black, bold = true, italic = true },
    IncSearch = { bg = colors.green, fg = colors.black, bold = true, italic = true },
    Substitute = { bg = colors.blue, fg = colors.black, bold = true },
    MatchParen = { bg = colors.none, fg = colors.grape, link = "", bold = true },
    FloatBorder = { fg = colors.float_border },
    LazyGitBorder = { fg = colors.border },

    -- statusline
    St_NormalMode = { bg = colors.green },
    St_NormalModeSep = { fg = colors.green },
    St_VisualMode = { bg = colors.blue },
    St_VisualModeSep = { fg = colors.blue },
    St_InsertMode = { bg = colors.lavender },
    St_InsertModeSep = { fg = colors.lavender },
    St_CommandMode = { bg = colors.orange },
    St_CommandModeSep = { fg = colors.orange },
    St_file = { fg = colors.white },
    St_pos_icon = { bg = colors.orange },
    St_pos_text = { fg = colors.orange },
    St_pos_sep = { fg = colors.orange },
    St_cwd_icon = { bg = colors.peach },
    St_cwd_sep = { bg = "#2d3139", fg = colors.peach },

    -- dashboard
    NvDashAscii = { bg = colors.none, fg = colors.navy },
    NvDashButtons = { bg = colors.none, fg = colors.sky },

    -- tabline
    TbLineBufOff = { fg = colors.comment, bg = colors.bg_tab_off },
    TbLineBufOffModified = { fg = colors.comment, bg = colors.bg_tab_off },
    TbLineBufOffClose = { fg = colors.comment, bg = colors.bg_tab_off },
    TblineFill = { bg = colors.bg_tab_off },
    TbBufOn = { bg = "#2d3139" },
    TbBufOnClose = { bg = "#2d3139" },
    TbBufOnModified = { bg = "#2d3139" },

    -- cmp
    CmpItemAbbr = { fg = colors.white, italic = true },
    CmpItemAbbrMatch = { fg = colors.blue, bold = true, italic = true },
    CmpDoc = { bg = colors.none },
    CmpDocBorder = { fg = colors.float_border, bg = colors.none },
    CmpPmenu = { bg = colors.none },
    CmpSel = { link = "PmenuSel", bg = colors.blue, fg = colors.blue, bold = true, italic = true },

    -- statusline
    StatusLine = { bg = colors.none, fg = colors.none },
    StatusLineNC = { bg = colors.none, fg = colors.none },
  },
  add = {
    -- default
    TabLine = { bg = colors.none, fg = colors.none },
    DiagnosticVirtualTextOk = { fg = colors.lime, link = "" },
    DiagnosticVirtualTextError = { fg = colors.peach, link = "" },
    DiagnosticVirtualTextWarn = { fg = colors.sunshine, link = "" },
    DiagnosticVirtualTextInfo = { fg = colors.aqua, link = "" },
    DiagnosticVirtualTextHint = { fg = colors.lavender, link = "" },
    DiagnosticUnderlineHint = { sp = colors.magenta, undercurl = true, italic = true },
    DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true, italic = true },
    DiagnosticUnderlineError = { sp = colors.red, undercurl = true, italic = true },
    DiagnosticUnderlineInfo = { sp = colors.white, undercurl = true, italic = true },
    DiagnosticUnderlineOk = { sp = colors.green, undercurl = true, italic = true },

    -- text
    TextGreen = { fg = colors.green },
    TextRed = { fg = colors.red },
    TextBlue = { fg = colors.blue },
    TextMagenta = { fg = colors.magenta },
    TextYellow = { fg = colors.yellow },

    -- statusline
    St_LspStatus_Sep = { fg = "#81a1c1" },
    St_LspStatus_Icon = { fg = "statusline_bg", bg = "#81a1c1" },
    St_LspStatus_Text = { fg = "#abb2bf", bg = "#2d3139" },
    St_file_icon = { fg = colors.white, bg = "#2d3139" },
    St_git_icons = { fg = colors.magenta, bg = colors.none },
    St_git_text = { fg = colors.gray, bg = colors.none },
    St_qf_icons = { fg = colors.magenta, bg = colors.none },
    St_qf_text = { fg = colors.gray, bg = colors.none },
    St_TelescopeMode = { bg = colors.yellow, fg = colors.mode_fg, bold = true },
    St_TelescopeModeSep = { fg = colors.yellow, bold = true },
    St_LazyNvimMode = { bg = colors.magenta, fg = colors.mode_fg, bold = true },
    St_LazyNvimModeSep = { fg = colors.magenta, bold = true },
    St_NvimTreeMode = { bg = colors.cyan, fg = colors.mode_fg, bold = true },
    St_NvimTreeModeSep = { fg = colors.cyan, bold = true },
    St_LazyGitMode = { bg = colors.cyan, fg = colors.mode_fg, bold = true },
    St_LazyGitModeSep = { fg = colors.cyan, bold = true },
    St_LineAndColumn_Sep = { fg = colors.orange },
    St_LineAndColumn_Icon = { fg = "statusline_bg", bg = colors.orange },
    St_LineAndColumn_Text = { fg = colors.white, bg = "#2d3139" },
    St_Ollama_Sep = { fg = colors.red },
    St_Ollama_Icon = { fg = "statusline_bg", bg = colors.red },
    St_Ollama_Text = { fg = colors.white, bg = "#2d3139" },
    St_Folder_Sep = { fg = colors.red },
    St_Folder_Icon = { fg = "statusline_bg", bg = colors.red },
    St_Folder_Text = { fg = colors.white, bg = "#2d3139" },

    --winbar
    WinBar = { bg = colors.none },
    WinBarNC = { bg = colors.none },
    WinbarEmpty = { bg = colors.bg2 },

    --tabline
    TbLinePadding = { bg = colors.bg, fg = colors.red },
  },
}
