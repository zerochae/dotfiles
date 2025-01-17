local M = {
  ---@type Base46HLGroupsList
  override = {},
  ---@type HLTable
  add = {},
}

local function merge(integration, orign_table)
  return vim.tbl_extend("force", integration, orign_table)
end

local integrations = {
  navic = require "highlights.integrations.navic",
  git_graph = require "highlights.integrations.git-graph",
  fugit2 = require "highlights.integrations.fugit2",
  nvimtree = require "highlights.integrations.nvimtree",
  nvim_bqf = require "highlights.integrations.nvim-bqf",
  vm_visual_multi = require "highlights.integrations.vim-visual-multi",
  nui = require "highlights.integrations.nui",
}

local colors = require "ui.assets.colors"

local override = {
  -- default
  Comment = { italic = true },
  ["@comment"] = { italic = true },
  Search = { bg = colors.magenta, fg = colors.black, bold = true, italic = true },
  IncSearch = { bg = colors.green, fg = colors.black, bold = true, italic = true },
  Substitute = { bg = colors.blue, fg = colors.black, bold = true },
  MatchParen = { bg = colors.none, fg = colors.grape, link = "", bold = true },
  FloatBorder = { fg = colors.border },
  LazyGitBorder = { fg = colors.border },

  -- telescope
  -- TelescopeNormal = { fg = colors.black },
  -- TelescopePromptNormal = { bg = colors.bg2 },
  TelescopeBorder = { fg = colors.black },
  TelescopePromptBorder = { fg = colors.black },
  TelescopeResultsTitle = { bg = colors.magenta, fg = colors.black },

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

  --hop
  HopNextKey = { bg = colors.red, fg = colors.black, bold = true },
  HopNextKey1 = { bg = colors.cyan, fg = colors.black, bold = true },
  HopNextKey2 = { bg = colors.teal, fg = colors.black, bold = true },

  -- dashboard
  NvDashAscii = { bg = colors.none, fg = colors.navy },
  NvDashButtons = { bg = colors.none, fg = colors.sky },

  -- syntax
  ["@constant"] = { fg = colors.orange },
  ["@variable"] = { fg = colors.white },
  ["@property"] = { fg = colors.peach },
  ["@parameter"] = { fg = colors.orange },
  ["@operator"] = { fg = colors.cyan },
  ["@punctuation.bracket"] = { fg = colors.orange },
  ["@function.builtin"] = { fg = colors.cyan },
  ["@punctuation.delimiter"] = { fg = colors.cyan },
  Conditional = { fg = colors.plum },
  Repeat = { fg = colors.tangerine },

  -- gitsings
  CodeActionText = { fg = colors.white },

  -- indent blank line
  IndentBlanklineContextChar = { fg = colors.obsidian },
  CursorLineNr = { fg = colors.plum },

  DiagnosticHint = { fg = colors.magenta },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticError = { fg = colors.red },
  DiagnosticInfo = { fg = colors.white },
  DiagnosticOk = { fg = colors.green },

  -- tabline
  TbLineBufOff = { fg = colors.comment, bg = colors.bg_tab_off },
  TbLineBufOffModified = { fg = colors.comment, bg = colors.bg_tab_off },
  TbLineBufOffClose = { fg = colors.comment, bg = colors.bg_tab_off },
  TblineFill = { bg = colors.bg_tab_off },

  -- cmp
  CmpItemAbbr = { fg = colors.white, italic = true },
  CmpItemAbbrMatch = { fg = colors.blue, bold = true, italic = true },
  CmpDoc = { bg = colors.none },
  CmpDocBorder = { fg = colors.darker_black, bg = colors.none },
  CmpPmenu = { bg = colors.none },
  CmpSel = { link = "PmenuSel", bg = colors.blue, fg = colors.blue, bold = true, italic = true },

  -- statusline
  StatusLine = { bg = colors.bg, fg = colors.none },
  StatusLineNC = { bg = colors.bg, fg = colors.none },

  -- showkeys
  SkActive = { bg = colors.red, fg = colors.mode_fg },
}

M.add = {
  IndentBlanklineIndent1 = { fg = colors.red, nocombine = true },
  IndentBlanklineIndent2 = { fg = colors.yellow, nocombine = true },
  IndentBlanklineIndent3 = { fg = colors.green, nocombine = true },
  IndentBlanklineIndent4 = { fg = colors.cyan, nocombine = true },
  IndentBlanklineIndent5 = { fg = colors.blue, nocombine = true },
  IndentBlanklineIndent6 = { fg = colors.magenta, nocombine = true },
  -- default
  TabLine = { bg = colors.none, fg = colors.none },
  DiagnosticVirtualTextError = { fg = colors.peach, link = "" },
  DiagnosticVirtualTextWarn = { fg = colors.sunshine, link = "" },
  DiagnosticVirtualTextInfo = { fg = colors.aqua, link = "" },
  DiagnosticVirtualTextHint = { fg = colors.lavender, link = "" },
  DiagnosticUnderlineHint = { sp = colors.magenta, undercurl = true },
  DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
  DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
  DiagnosticUnderlineInfo = { sp = colors.white, undercurl = true },
  DiagnosticUnderlineOk = { sp = colors.green, undercurl = true },

  -- visual-multi
  VM_Extend = { bg = colors.blue, fg = colors.black },
  VM_Cursor = { bg = colors.magenta, fg = colors.black },

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

  --telescope
  TelescopeMatching = { fg = colors.plum, link = "" },

  -- navic
  NavicDepthLimitIndicator = { bg = colors.none, fg = "yellow" },
  NavicFolderSeparator = { bg = colors.yellow, fg = colors.black },
  NavicFolderBlock = { bg = colors.red, fg = colors.black },

  -- gitsign
  GitSignsChange = { fg = colors.orange },
  GitSignsAdd = { fg = colors.green },
  GitSignsDelete = { fg = colors.red },

  --lazygit
  LazyGitBorder = { fg = colors.blue },
  LazyCommitIssue = { fg = colors.mustard },

  -- diffview
  DiffviewFilePanelTitle = { fg = colors.blue },
  DiffviewDiffAdd = { bg = "#2A304B", fg = colors.none },
  DiffviewDiffChange = { bg = "#2A304B" },
  DiffviewDiffDelete = { bg = "#4F3A4F" },
  DiffviewDiffAddAsDelete = { bg = "#4F3A4F", fg = colors.none },
  DiffAdd = { bg = "#2A304B", fg = colors.none },
  DiffDelete = { bg = "#34232C" },
  DiffChange = { bg = "#384268" },
  DiffviewDiffText = { bg = "#484466", fg = colors.none, link = "" },
  DiffviewStatusModified = { fg = colors.yellow },
  DiffviewStatusAdded = { fg = colors.green },
  DiffviewFilePanelSelected = { fg = colors.white },
  DiffviewFilePanelFileName = { fg = colors.comment },

  -- syntax
  ["@namespace.builtin"] = { fg = colors.yellow },

  -- lua
  LuaDocumentTag = { fg = colors.plum },
  LuaDocumentParam = { fg = colors.orange },
  LuaGlobalVim = { fg = colors.mustard },
  ["@variable.member.lua"] = { fg = colors.red, link = "" },

  -- tsx, vue, javascript, typescript
  ["@type.qualifier.tsx"] = { fg = colors.magenta, link = "" },
  ["@type.qualifier.vue"] = { fg = colors.magenta, link = "" },
  ["@type.qualifier.typescript"] = { fg = colors.magenta, link = "" },
  ["@type.qualifier.javascript"] = { fg = colors.magenta, link = "" },

  ["@parameter.tsx"] = { fg = colors.orange, link = "" },
  ["@parameter.vue"] = { fg = colors.orange, link = "" },
  ["@parameter.javascript"] = { fg = colors.orange, link = "" },
  ["@parameter.typescript"] = { fg = colors.orange, link = "" },

  ["@variable.parameter.tsx"] = { fg = colors.orange, link = "" },
  ["@variable.parameter.vue"] = { fg = colors.orange, link = "" },
  ["@variable.parameter.javascript"] = { fg = colors.orange, link = "" },
  ["@variable.parameter.typescript"] = { fg = colors.orange, link = "" },
  ["@variable.parameter.lua"] = { fg = colors.orange, link = "" },
  ["@variable.parameter.java"] = { fg = colors.orange, link = "" },

  ["@property.tsx"] = { fg = colors.peach },
  ["@property.vue"] = { fg = colors.peach },
  ["@property.javascript"] = { fg = colors.peach },
  ["@property.typescript"] = { fg = colors.peach },
  ["@property.html"] = { fg = colors.peach },

  ["@tag.tsx"] = { fg = colors.red },
  ["@tag.vue"] = { fg = colors.red },
  ["@tag.javascript"] = { fg = colors.red },
  ["@tag.typescript"] = { fg = colors.red },
  ["@tag.html"] = { fg = colors.red },

  ["@tag.builtin.tsx"] = { fg = colors.red },

  ["@constructor.tsx"] = { fg = colors.red, link = "" },
  ["@constructor.vue"] = { fg = colors.red, link = "" },
  ["@constructor.javascript"] = { fg = colors.red, link = "" },
  ["@constructor.typescript"] = { fg = colors.red, link = "" },

  ["@operator.tsx"] = { fg = colors.cyan },
  ["@operator.vue"] = { fg = colors.cyan },
  ["@operator.javascript"] = { fg = colors.cyan },
  ["@operator.typescript"] = { fg = colors.cyan },
  ["@operator.html"] = { fg = colors.cyan },

  ["@punctuation.special.tsx"] = { fg = colors.magenta },
  ["@punctuation.special.vue"] = { fg = colors.magenta },
  ["@punctuation.special.javascript"] = { fg = colors.magenta },
  ["@punctuation.special.typescript"] = { fg = colors.magenta },

  ["@tag.attribute.tsx"] = { fg = colors.orange },
  ["@tag.attribute.vue"] = { fg = colors.orange },
  ["@tag.attribute.javascript"] = { fg = colors.orange },
  ["@tag.attribute.typescript"] = { fg = colors.orange },
  ["@tag.attribute.html"] = { fg = colors.orange },

  ["@tag.delimiter.tsx"] = { fg = colors.cyan },
  ["@tag.delimiter.vue"] = { fg = colors.cyan },
  ["@tag.delimiter.javascript"] = { fg = colors.cyan },
  ["@tag.delimiter.typescript"] = { fg = colors.cyan },
  ["@tag.delimiter.html"] = { fg = colors.cyan },

  ["@punctuation.delimiter.tsx"] = { fg = colors.cyan },
  ["@punctuation.delimiter.vue"] = { fg = colors.cyan },
  ["@punctuation.delimiter.javascript"] = { fg = colors.cyan },
  ["@punctuation.delimiter.typescript"] = { fg = colors.cyan },
  ["@punctuation.delimiter.html"] = { fg = colors.cyan },

  ["@punctuation.bracket.tsx"] = { fg = colors.cyan },
  ["@punctuation.bracket.vue"] = { fg = colors.cyan },
  ["@punctuation.bracket.javascript"] = { fg = colors.cyan },
  ["@punctuation.bracket.typescript"] = { fg = colors.cyan },
  ["@punctuation.bracket.lua"] = { fg = colors.cyan },
  ["@punctuation.bracket.java"] = { fg = colors.cyan },

  ["@text.uri.tsx"] = { fg = colors.none },
  ["@text.uri.vue"] = { fg = colors.none },
  ["@text.uri.javascript"] = { fg = colors.none },
  ["@text.uri.typescript"] = { fg = colors.none },
  ["@text.uri.html"] = { fg = colors.none },
  ["@variable.member.typescript"] = { fg = colors.red, link = "" },
  ["@variable.member.javascript"] = { fg = colors.red, link = "" },
  ["@variable.member.tsx"] = { fg = colors.red, link = "" },

  -- rust
  ["@variable.rust"] = { fg = colors.red },
  ["@function.macro.rust"] = { fg = colors.blue },
  ["@namespace.rust"] = { fg = colors.orange },
  ["@variable.member.rust"] = { fg = colors.red, link = "" },
  ["@module.rust"] = { fg = colors.magenta },
  ["@punctuation.bracket.rust"] = { fg = colors.cyan },

  -- java
  ["@include.java"] = { fg = colors.magenta },
  ["@type.qualifier.java"] = { fg = colors.magenta },
  ["@repeat.java"] = { fg = colors.magenta },
  ["@attribute.java"] = { fg = colors.orange },
  ["@variable.member.java"] = { fg = colors.red, link = "" },

  -- html
  htmlTag = { fg = colors.cyan },
  htmlEndTag = { fg = colors.cyan },
  htmlArg = { fg = colors.orange, link = "" },

  -- css
  ["@variable.css"] = { fg = colors.red },

  -- bash
  ["@constant.bash"] = { fg = colors.red },

  --gitcommit
  ["@spell.gitcommit"] = { fg = colors.blue },
  ["@text.gitcommit"] = { fg = colors.cyan },

  -- nvimtree
  WinSeparator = { fg = colors.bg, bg = colors.none, link = "" },
  NvimTreeOpenedHL = { fg = colors.blue },

  --noice
  NoiceCmdlinePopupBorder = { fg = colors.lime },
  NoiceCmdLinePopupTitle = { fg = colors.lime },
  NoiceCmdlineIcon = { fg = colors.green },
  NoiceCmdlineBashIcon = { fg = colors.red },
  NoiceCmdlineHelpIcon = { fg = colors.blue },
  NoiceCmdlineHlIcon = { fg = colors.red },
  NoiceCmdlineReplaceIcon = { fg = colors.orange },
  NoiceCmdlineMapIcon = { fg = colors.white },
  NoiceCmdlineCalculatorIcon = { fg = colors.white },
  NoiceCmdlineLuaIcon = { link = "DevIconLua" },
  NoiceConfirmBorder = { fg = colors.green },
  NoicePopupmenuSelected = { bg = colors.blue, fg = colors.black },

  --winbar
  WinBar = { bg = colors.none },
  WinBarNC = { bg = colors.none },
  WinbarEmpty = { bg = colors.bg2 },

  --tabLine
  TbLinePadding = { bg = colors.bg, fg = colors.red },

  -- statusline
  StatusLine = { bg = colors.bg, fg = colors.none },
  StatusLineNC = { bg = colors.bg, fg = colors.none },
}

M.override = merge(override, M.override)

-- navic
M.override = merge(integrations.navic, M.override)

-- nvimtree
M.override = merge(integrations.nvimtree, M.override)

-- git-graph
M.add = merge(integrations.git_graph, M.add)

-- fugit2
M.add = merge(integrations.fugit2, M.add)

-- nvim_bqf
M.add = merge(integrations.nvim_bqf, M.add)

-- vm_visual_multi
M.add = merge(integrations.vm_visual_multi, M.add)

-- nui
M.add = merge(integrations.nui, M.add)

return M
