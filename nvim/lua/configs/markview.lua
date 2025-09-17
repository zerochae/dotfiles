local present, markview = pcall(require, "markview")

if not present then
  return
end

---@param group string New highlight group.
---@return { [string]: { hl: string } } New configuration.
local function generic_hl(group)
  return {
    ["github%.com/[%a%d%-%_%.]+%/?$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/?$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/tree/[%a%d%-%_%.]+%/?$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/commits/[%a%d%-%_%.]+%/?$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/releases$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/tags$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/issues$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/pulls$"] = {
      hl = group,
    },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/wiki$"] = {
      hl = group,
    },
  }
end

local presets = require "markview.presets"
local colors = require "ui.assets.colors"

markview.setup {
  highlight_groups = {
    MarkviewPalette0 = { bg = colors.cyan, fg = colors.black },
    MarkviewPalette1 = { bg = colors.red, fg = colors.black },
    MarkviewPalette2 = { bg = colors.orange, fg = colors.black },
    MarkviewPalette3 = { bg = colors.yellow, fg = colors.black },
    MarkviewPalette4 = { bg = colors.green, fg = colors.black },
    MarkviewPalette5 = { bg = colors.blue, fg = colors.black },
    MarkviewPalette6 = { bg = colors.magenta, fg = colors.black },
    MarkviewPalette0Sign = { fg = colors.cyan },
    MarkviewPalette1Sign = { fg = colors.red },
    MarkviewPalette2Sign = { fg = colors.orange },
    MarkviewPalette3Sign = { fg = colors.yellow },
    MarkviewPalette4Sign = { fg = colors.green },
    MarkviewPalette5Sign = { fg = colors.blue },
    MarkviewPalette6Sign = { fg = colors.magenta },
    MarkviewPalette7Sign = { fg = colors.tangerine },
    MarkviewIcon0 = { fg = colors.cyan },
    MarkviewIcon1 = { fg = colors.red },
    MarkviewIcon2 = { fg = colors.orange },
    MarkviewIcon3 = { fg = colors.yellow },
    MarkviewIcon4 = { fg = colors.green },
    MarkviewIcon5 = { fg = colors.blue },
    MarkviewIcon6 = { fg = colors.magenta },
    MarkviewCode = { bg = colors.bg },
    MarkviewCodeInfo = { bg = colors.red, fg = colors.red },
    MarkviewCodeFg = { fg = colors.fg },
    MarkviewInlineCode = { fg = colors.fg },
    MarkviewBlockQuoteDefault = { fg = colors.cyan },
    MarkviewBlockQuoteError = { fg = colors.red },
    MarkviewBlockQuoteNote = { fg = colors.blue },
    MarkviewBlockQuoteOk = { fg = colors.green },
    MarkviewBlockQuoteSpecial = { fg = colors.magenta },
    MarkviewBlockQuoteWarn = { fg = colors.orange },
    MarkviewCheckboxCancelled = { fg = colors.red },
    MarkviewCheckboxChecked = { fg = colors.green },
    MarkviewCheckboxPending = { fg = colors.orange },
    MarkviewCheckboxProgress = { fg = colors.blue },
    MarkviewCheckboxUnchecked = { fg = colors.fg },
    MarkviewCheckboxStriked = { fg = colors.cyan },
    MarkviewTableHeader = { fg = colors.red },
    MarkviewTableBorder = { fg = colors.red },
    MarkviewTableAlignCenter = { fg = colors.red },
    MarkviewTableAlignLeft = { fg = colors.red },
    MarkviewTableAlignRight = { fg = colors.red },
    MarkviewListItemMinus = { fg = colors.orange },
    MarkviewListItemPlus = { fg = colors.blue },
    MarkviewListItemStar = { fg = colors.magenta },
  },
  preview = {
    -- icon_provider = "devicons",
  },
  markdown = {
    reference_definitions = generic_hl "MarkviewPalette4Fg",
    headings = presets.headings.glow,
    horizontal_rules = presets.horizontal_rules.thick,
    tables = presets.tables.single,
    code_blocks = {
      label_direction = "left",
    },
  },
  markdown_inline = {
    hyperlinks = generic_hl "MarkviewHyperlink",
    uri_autolinks = generic_hl "MarkviewEmail",
  },
  typst = {
    url_links = generic_hl "MarkviewEmail",
  },
  experimental = {
    check_rtp = false,
  },
}
