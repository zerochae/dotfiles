-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true },
  NavicIconsConstant = { bg = "NONE" },
  NavicIconsFunction = { bg = "NONE" },
  NavicIconsIdentifier = { bg = "NONE" },
  NavicIconsField = { bg = "NONE" },
  NavicIconsVariable = { bg = "NONE" },
  NavicIconsSnippet = { bg = "NONE" },
  NavicIconsText = { bg = "NONE" },
  NavicIconsStructure = { bg = "NONE" },
  NavicIconsType = { bg = "NONE" },
  NavicIconsKeyword = { bg = "NONE" },
  NavicIconsMethod = { bg = "NONE" },
  NavicIconsConstructor = { bg = "NONE" },
  NavicIconsFolder = { bg = "NONE" },
  NavicIconsModule = { bg = "NONE" },
  NavicIconsProperty = { bg = "NONE" },
  NavicIconsEnum = { bg = "NONE" },
  NavicIconsUnit = { bg = "NONE" },
  NavicIconsClass = { bg = "NONE" },
  NavicIconsFile = { bg = "NONE" },
  NavicIconsInterface = { bg = "NONE" },
  NavicIconsColor = { bg = "NONE" },
  NavicIconsReference = { bg = "NONE" },
  NavicIconsEnumMember = { bg = "NONE" },
  NavicIconsStruct = { bg = "NONE" },
  NavicIconsValue = { bg = "NONE" },
  NavicIconsEvent = { bg = "NONE" },
  NavicIconsOperator = { bg = "NONE" },
  NavicIconsTypeParameter = { bg = "NONE" },
  NavicIconsNamespace = { bg = "NONE" },
  NavicIconsPackage = { bg = "NONE" },
  NavicIconsString = { bg = "NONE" },
  NavicIconsNumber = { bg = "NONE" },
  NavicIconsBoolean = { bg = "NONE" },
  NavicIconsArray = { bg = "NONE" },
  NavicIconsObject = { bg = "NONE" },
  NavicIconsKey = { bg = "NONE" },
  NavicIconsNull = { bg = "NONE" },
  NavicText = { fg = "white", bg = "NONE" },
  NavicSeparator = { bg = "NONE" },
  NoiceMiniCustom = { bg = "NONE", fg = "white" },
  Search = { bg = "purple", fg = "black", bold = true },
  IncSearch = { bg = "green", fg = "black", bold = true },
  Substitute = { bg = "blue", fg = "black", bold = true },
  HopNextKey = { bg = "red", fg = "black", bold = true },
  HopNextKey1 = { bg = "cyan", fg = "black", bold = true },
  HopNextKey2 = { bg = "teal", fg = "black", bold = true },
  St_cwd_sep = { bg = "#2d3139" },
  NvDashAscii = { bg = "NONE", fg = "nord_blue" },
  NvDashButtons = { bg = "NONE", fg = "blue" },
  NeofetchDot1 = { fg = "white" },
  NeofetchDot2 = { fg = "pink" },
  NeofetchDot3 = { fg = "green" },
  NeofetchDot4 = { fg = "yellow" },
  NeofetchDot5 = { fg = "blue" },
  NeofetchDot6 = { fg = "red" },
  NeofetchDot7 = { fg = "cyan" },
  NeofetchDot8 = { fg = "purple" },
}

---@type HLTable
M.add = {
  St_LspStatus_Sep = { fg = "#81a1c1" },
  St_LspStatus_Icon = { fg = "statusline_bg", bg = "#81a1c1" },
  St_LspStatus_Text = { fg = "#abb2bf", bg = "#2d3139" },
  NavicDepthLimitIndicator = { bg = "NONE", fg = "yellow" },
  OctoEditable = { bg = "#1a1925" },
  NeofetchDot1 = { fg = "white" },
  NeofetchDot2 = { fg = "pink" },
  NeofetchDot3 = { fg = "green" },
  NeofetchDot4 = { fg = "yellow" },
  NeofetchDot5 = { fg = "blue" },
  NeofetchDot6 = { fg = "red" },
  NeofetchDot7 = { fg = "cyan" },
  NeofetchDot8 = { fg = "purple" },
}

return M