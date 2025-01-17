local colors = require "ui.assets.colors"

return {
  override = {
    -- telescope
    -- TelescopeNormal = { fg = colors.black },
    -- TelescopePromptNormal = { bg = colors.bg2 },
    TelescopeBorder = { fg = colors.black },
    TelescopePromptBorder = { fg = colors.black },
    TelescopeResultsTitle = { bg = colors.magenta, fg = colors.black },

    --hop
    HopNextKey = { bg = colors.red, fg = colors.black, bold = true },
    HopNextKey1 = { bg = colors.cyan, fg = colors.black, bold = true },
    HopNextKey2 = { bg = colors.teal, fg = colors.black, bold = true },

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

    -- showkeys
    SkActive = { bg = colors.red, fg = colors.mode_fg },
  },

  add = {
    IndentBlanklineIndent1 = { fg = colors.red, nocombine = true },
    IndentBlanklineIndent2 = { fg = colors.yellow, nocombine = true },
    IndentBlanklineIndent3 = { fg = colors.green, nocombine = true },
    IndentBlanklineIndent4 = { fg = colors.cyan, nocombine = true },
    IndentBlanklineIndent5 = { fg = colors.blue, nocombine = true },
    IndentBlanklineIndent6 = { fg = colors.magenta, nocombine = true },

    -- visual-multi
    VM_Extend = { bg = colors.blue, fg = colors.black },
    VM_Cursor = { bg = colors.magenta, fg = colors.black },

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
  },
}
