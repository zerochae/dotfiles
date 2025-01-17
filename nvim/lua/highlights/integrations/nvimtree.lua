local colors = require "assets.colors"

return {
  -- nvimtree
  NvimtreeGitFolderStagedHL = { fg = colors.green },
  NvimTreeGitDirty = { fg = colors.yellow },
  NvimTreeFolderIcon = { fg = colors.yellow },
  NvimTreeFolderName = { fg = colors.white },
  NvimTreeRootFolder = { fg = colors.blue },
  NvimTreeOpenedFolderName = { fg = colors.white },
  NvimTreeNormal = { bg = colors.none },
  -- NvimTreeNormal = { bg = colors.bg2 },
  NvimTreeIndentMarker = { fg = colors.border },
  NvimTreeWinSeparator = { fg = colors.bg, bg = colors.none, link = "" },
}
