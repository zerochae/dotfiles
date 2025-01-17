local present, markview = pcall(require, "markview")

if not present then
  return
end

local colors = require "ui.assets.colors"

markview.setup {
  modes = { "n", "v" },
  headings = {
    shift_width = 0,

    heading_1 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h1_inv",

      icon = "󰼏  ",
      sign = "",
      hl = "decorated_h1",
    },
    heading_2 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h2_inv",

      icon = "󰎨  ",
      sign = "",
      hl = "decorated_h2",
    },
    heading_3 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h3_inv",

      icon = "󰼑  ",
      hl = "decorated_h3",
      sign = "",
    },
    heading_4 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h4_inv",

      icon = "󰎲  ",
      sign = "",
      hl = "decorated_h4",
    },
    heading_5 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h5_inv",

      icon = "󰼓  ",
      sign = "",
      hl = "decorated_h5",
    },
    heading_6 = {
      style = "label",

      padding_left = " ",
      padding_right = " ",

      corner_right = "█▓▒░",
      corner_right_hl = "decorated_h6_inv",

      icon = "󰎴  ",
      sign = "",
      hl = "decorated_h6",
    },
    setext_1 = {
      style = "label",
      hl = "decorated_h1",
    },
    setext_2 = {
      style = "label",
      hl = "decorated_h2",
    },
  },
  code_blocks = {
    enable = true,
    style = "language",
    hl = "markdownCodeBlock",
    position = "overlay",
    min_width = 60,
    pad_char = " ",
    pad_amount = 2,
    language_direction = "right",
    sign = false,
    sign_hl = nil,
  },
  tables = {
    enable = true,
    use_virt_lines = false,
    text = {
      "╭",
      "─",
      "╮",
      "┬",
      "├",
      "│",
      "┤",
      "┼",
      "╰",
      "─",
      "╯",
      "┴",
      "╼",
      "╾",
      "╴",
      "╶",
    },
    hl = {
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
      "rainbow1",
    },
  },
  list_items = {
    shift_amount = 2,
    marker_plus = {
      add_padding = false,
      marker = "•",
      marker_hl = "rainbow2",
    },
    marker_minus = {
      add_padding = false,
      marker = "•",
      marker_hl = "rainbow2",
    },
    marker_star = {
      add_padding = false,
      marker = "•",
      marker_hl = "rainbow2",
    },
  },
  checkboxes = {
    enable = true,
    checked = {
      text = "[✔]",
    },
    unchecked = {
      text = "[✘]",
    },
  },
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
