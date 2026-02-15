local colors = require("theme.palettes." .. require("grayrc").theme.palette)

local style = "atom_colored" -- default / atom_colored

local kind_links = {
  BlinkCmpKindFunction = { link = "Function" },
  BlinkCmpKindMethod = { link = "Function" },
  BlinkCmpKindConstructor = { link = "@constructor" },
  BlinkCmpKindVariable = { link = "@variable" },
  BlinkCmpKindField = { link = "@variable.member" },
  BlinkCmpKindProperty = { link = "@property" },
  BlinkCmpKindIdentifier = { link = "Identifier" },
  BlinkCmpKindSnippet = { link = "Special" },
  BlinkCmpKindText = { link = "String" },
  BlinkCmpKindClass = { link = "Type" },
  BlinkCmpKindInterface = { link = "Type" },
  BlinkCmpKindModule = { link = "@module" },
  BlinkCmpKindKeyword = { link = "Keyword" },
  BlinkCmpKindConstant = { link = "Constant" },
  BlinkCmpKindEnum = { link = "Type" },
  BlinkCmpKindEnumMember = { link = "Constant" },
  BlinkCmpKindStruct = { link = "Structure" },
  BlinkCmpKindUnit = { link = "Number" },
  BlinkCmpKindValue = { link = "Number" },
  BlinkCmpKindEvent = { link = "Special" },
  BlinkCmpKindOperator = { link = "Operator" },
  BlinkCmpKindTypeParameter = { link = "Type" },
  BlinkCmpKindFile = { link = "Directory" },
  BlinkCmpKindFolder = { link = "Directory" },
  BlinkCmpKindReference = { link = "Special" },
  BlinkCmpKindColor = { link = "Special" },

  BlinkCmpKindTextFunction = { link = "Function" },
  BlinkCmpKindTextMethod = { link = "Function" },
  BlinkCmpKindTextConstructor = { link = "@constructor" },
  BlinkCmpKindTextVariable = { link = "@variable" },
  BlinkCmpKindTextField = { link = "@variable.member" },
  BlinkCmpKindTextProperty = { link = "@property" },
  BlinkCmpKindTextIdentifier = { link = "Identifier" },
  BlinkCmpKindTextSnippet = { link = "Special" },
  BlinkCmpKindTextText = { link = "String" },
  BlinkCmpKindTextClass = { link = "Type" },
  BlinkCmpKindTextInterface = { link = "Type" },
  BlinkCmpKindTextModule = { link = "@module" },
  BlinkCmpKindTextKeyword = { link = "Keyword" },
  BlinkCmpKindTextConstant = { link = "Constant" },
  BlinkCmpKindTextEnum = { link = "Type" },
  BlinkCmpKindTextEnumMember = { link = "Constant" },
  BlinkCmpKindTextStruct = { link = "Structure" },
  BlinkCmpKindTextUnit = { link = "Number" },
  BlinkCmpKindTextValue = { link = "Number" },
  BlinkCmpKindTextEvent = { link = "Special" },
  BlinkCmpKindTextOperator = { link = "Operator" },
  BlinkCmpKindTextTypeParameter = { link = "Type" },
  BlinkCmpKindTextFile = { link = "Directory" },
  BlinkCmpKindTextFolder = { link = "Directory" },
  BlinkCmpKindTextReference = { link = "Special" },
  BlinkCmpKindTextColor = { link = "Special" },
}

local atom_colored_kinds = {
  BlinkCmpKindFunction = { fg = "#61afef", bg = "#324c65" },
  BlinkCmpKindMethod = { fg = "#61afef", bg = "#324c65" },
  BlinkCmpKindConstructor = { fg = "#61afef", bg = "#324c65" },
  BlinkCmpKindVariable = { fg = "#c678dd", bg = "#503b5f" },
  BlinkCmpKindField = { fg = "#e06c75", bg = "#583840" },
  BlinkCmpKindProperty = { fg = "#e06c75", bg = "#583840" },
  BlinkCmpKindIdentifier = { fg = "#e06c75", bg = "#583840" },
  BlinkCmpKindSnippet = { fg = "#e06c75", bg = "#583840" },
  BlinkCmpKindText = { fg = "#98c379", bg = "#425241" },
  BlinkCmpKindClass = { fg = "#519ABA", bg = "#2d4655" },
  BlinkCmpKindInterface = { fg = "#98c379", bg = "#425241" },
  BlinkCmpKindModule = { fg = "#e5c07b", bg = "#595142" },
  BlinkCmpKindKeyword = { fg = "#c8ccd4", bg = "#51555d" },
  BlinkCmpKindConstant = { fg = "#d19a66", bg = "#53463c" },
  BlinkCmpKindEnum = { fg = "#61afef", bg = "#324c65" },
  BlinkCmpKindEnumMember = { fg = "#de98fd", bg = "#574569" },
  BlinkCmpKindStruct = { fg = "#c678dd", bg = "#503b5f" },
  BlinkCmpKindUnit = { fg = "#c678dd", bg = "#503b5f" },
  BlinkCmpKindValue = { fg = "#a3b8ef", bg = "#454f65" },
  BlinkCmpKindEvent = { fg = "#e7c787", bg = "#5a5345" },
  BlinkCmpKindOperator = { fg = "#abb2bf", bg = "#484d56" },
  BlinkCmpKindTypeParameter = { fg = "#e06c75", bg = "#583840" },
  BlinkCmpKindFile = { fg = "#c8ccd4", bg = "#51555d" },
  BlinkCmpKindFolder = { fg = "#c8ccd4", bg = "#51555d" },
  BlinkCmpKindReference = { fg = "#abb2bf", bg = "#484d56" },
  BlinkCmpKindColor = { fg = "#abb2bf", bg = "#484d56" },
}

local kind_text_hl = {
  BlinkCmpKindTextFunction = { fg = "#61afef" },
  BlinkCmpKindTextMethod = { fg = "#61afef" },
  BlinkCmpKindTextConstructor = { fg = "#61afef" },
  BlinkCmpKindTextVariable = { fg = "#c678dd" },
  BlinkCmpKindTextField = { fg = "#e06c75" },
  BlinkCmpKindTextProperty = { fg = "#e06c75" },
  BlinkCmpKindTextIdentifier = { fg = "#e06c75" },
  BlinkCmpKindTextSnippet = { fg = "#e06c75" },
  BlinkCmpKindTextText = { fg = "#98c379" },
  BlinkCmpKindTextClass = { fg = "#519ABA" },
  BlinkCmpKindTextInterface = { fg = "#98c379" },
  BlinkCmpKindTextModule = { fg = "#e5c07b" },
  BlinkCmpKindTextKeyword = { fg = "#c8ccd4" },
  BlinkCmpKindTextConstant = { fg = "#d19a66" },
  BlinkCmpKindTextEnum = { fg = "#61afef" },
  BlinkCmpKindTextEnumMember = { fg = "#de98fd" },
  BlinkCmpKindTextStruct = { fg = "#c678dd" },
  BlinkCmpKindTextUnit = { fg = "#c678dd" },
  BlinkCmpKindTextValue = { fg = "#a3b8ef" },
  BlinkCmpKindTextEvent = { fg = "#e7c787" },
  BlinkCmpKindTextOperator = { fg = "#abb2bf" },
  BlinkCmpKindTextTypeParameter = { fg = "#e06c75" },
  BlinkCmpKindTextFile = { fg = "#c8ccd4" },
  BlinkCmpKindTextFolder = { fg = "#c8ccd4" },
  BlinkCmpKindTextReference = { fg = "#abb2bf" },
  BlinkCmpKindTextColor = { fg = "#abb2bf" },
}

local is_atom = style == "atom_colored"

local M = {}

M.override = {
  BlinkCmpLabel = { fg = colors.white },
  BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
  BlinkCmpMenuSelection = { link = "PmenuSel", bold = true },
  BlinkCmpMenuBorder = { fg = colors.float_border },
  BlinkCmpKind = { fg = colors.comment },
  BlinkCmpMenu = { bg = colors.bg2 },
  BlinkCmpDoc = is_atom and { bg = colors.bg } or { bg = colors.none },
  BlinkCmpDocBorder = is_atom and { fg = colors.bg, bg = colors.bg } or { fg = colors.float_border, bg = colors.none },
}

M.add = is_atom and vim.tbl_deep_extend("force", atom_colored_kinds, kind_text_hl) or kind_links

M.draw = {
  padding = 0,
  gap = 1,
  columns = {
    { "kind_icon" },
    { "label", "label_description", gap = 1 },
    { "kind" },
  },
  components = {
    kind_icon = {
      text = function(ctx)
        return " " .. ctx.kind_icon .. " "
      end,
      highlight = function(ctx)
        return "BlinkCmpKind" .. ctx.kind
      end,
    },
    kind = {
      text = function(ctx)
        return ctx.kind .. " "
      end,
      highlight = function(ctx)
        return "BlinkCmpKindText" .. ctx.kind
      end,
    },
  },
}

M.menu = {
  scrollbar = false,
  border = "none",
}

M.documentation = {
  window = { border = "single" },
}

return M
