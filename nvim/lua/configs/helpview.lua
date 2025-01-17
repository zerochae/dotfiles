local present, helpview = pcall(require, "helpview")

if not present then
  return
end

local colors = require "assets.colors"

helpview.setup {
  headings = {
    heading_1 = {
      hl = "decorated_h1",
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
    },
    heading_2 = {
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
      hl = "decorated_h2",
    },
    heading_3 = {
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
      hl = "decorated_h3",
    },
    heading_4 = {
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
      hl = "decorated_h4",
    },
    heading_5 = {
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
      hl = "decorated_h5",
    },
    heading_6 = {
      style = "simple",
      parts = {
        "╭",
        "─",
        "╮",
        "│",
        " ",
        "",
        "╰",
        "─",
        "╯",
      },
      hl = "decorated_h6",
    },
  },
  code_blocks = { enable = true, hl = "markdownCodeBlock", language_hl = "Comment" },
  highlight_groups = {
    {
      group_name = "decorated_h1",
      value = { bg = colors.red, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h1_inv",
      value = { fg = colors.red, bold = true },
    },
    {
      group_name = "decorated_h2",
      value = { bg = colors.orange, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h2_inv",
      value = { fg = colors.orange, bold = true },
    },
    {
      group_name = "decorated_h3",
      value = { bg = colors.magenta, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h3_inv",
      value = { fg = colors.magenta, bold = true },
    },
    {
      group_name = "decorated_h4",
      value = { bg = colors.green, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h4_inv",
      value = { fg = colors.green, bold = true },
    },
    {
      group_name = "decorated_h5",
      value = { bg = colors.blue, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h5_inv",
      value = { fg = colors.blue, bold = true },
    },
    {
      group_name = "decorated_h6",
      value = { bg = colors.cyan, fg = colors.black, bold = true },
    },
    {
      group_name = "decorated_h6_inv",
      value = { fg = colors.cyan, bold = true },
    },
    {
      group_name = "rainbow1",
      value = { fg = colors.red },
    },
    {
      group_name = "rainbow2",
      value = { fg = colors.orange },
    },
    {
      group_name = "rainbow3",
      value = { fg = colors.magenta },
    },
    {
      group_name = "rainbow4",
      value = { fg = colors.green },
    },
    {
      group_name = "rainbow5",
      value = { fg = colors.blue },
    },
    {
      group_name = "MarkviewCol1Fg",
      value = { fg = colors.red },
    },
    {
      group_name = "MarkviewCol2Fg",
      value = { fg = colors.tangerine },
    },
    {
      group_name = "MarkviewCol3Fg",
      value = { fg = colors.magenta },
    },
    {
      group_name = "MarkviewCol4Fg",
      value = { fg = colors.green },
    },
    {
      group_name = "MarkviewCol5Fg",
      value = { fg = colors.blue },
    },
    {
      group_name = "MarkviewCol6Fg",
      value = { fg = colors.cyan },
    },
    {
      group_name = "MarkviewCol7Fg",
      value = { fg = colors.blue },
    },
    {
      group_name = "markdownLinkText",
      value = { fg = colors.blue },
    },
    -- {
    --   group_name = "markdownCodeBlock",
    --   value = { bg = colors.bg2 },
    -- },
  },
}
