local colors = require "custom.assets.colors"

return {
  Comment = { italic = true },
  ["@comment"] = { italic = true },
  Search = { bg = colors.magenta, fg = colors.black, bold = true, italic = true },
  IncSearch = { bg = colors.green, fg = colors.black, bold = true, italic = true },
  Substitute = { bg = colors.blue, fg = colors.black, bold = true },
  MatchParen = { bg = colors.none, fg = colors.grape, link = "", bold = true },
  FloatBorder = { fg = colors.border },
  LazyGitBorder = { fg = colors.border },
}
