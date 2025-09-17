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

    -- navic
    NavicIconsConstant = { bg = colors.none },
    NavicIconsFunction = { bg = colors.none },
    NavicIconsIdentifier = { bg = colors.none },
    NavicIconsField = { bg = colors.none },
    NavicIconsVariable = { bg = colors.none },
    NavicIconsSnippet = { bg = colors.none },
    NavicIconsText = { bg = colors.none },
    NavicIconsType = { bg = colors.none },
    NavicIconsKeyword = { bg = colors.none },
    NavicIconsMethod = { bg = colors.none },
    NavicIconsConstructor = { bg = colors.none },
    NavicIconsFolder = { bg = colors.none, fg = colors.yellow },
    NavicIconsModule = { bg = colors.none },
    NavicIconsProperty = { bg = colors.none },
    NavicIconsEnum = { bg = colors.none },
    NavicIconsClass = { bg = colors.none },
    NavicIconsFile = { bg = colors.none },
    NavicIconsInterface = { bg = colors.none },
    NavicIconsColor = { bg = colors.none },
    NavicIconsReference = { bg = colors.none },
    NavicIconsEnumMember = { bg = colors.none },
    NavicIconsStruct = { bg = colors.none },
    NavicIconsValue = { bg = colors.none },
    NavicIconsEvent = { bg = colors.none },
    NavicIconsOperator = { bg = colors.none },
    NavicIconsTypeParameter = { bg = colors.none },
    NavicIconsNamespace = { bg = colors.none },
    NavicIconsPackage = { bg = colors.none },
    NavicIconsString = { bg = colors.none },
    NavicIconsNumber = { bg = colors.none },
    NavicIconsBoolean = { bg = colors.none },
    NavicIconsArray = { bg = colors.none },
    NavicIconsObject = { bg = colors.none },
    NavicIconsKey = { bg = colors.none },
    NavicIconsNull = { bg = colors.none },
    NavicText = { fg = colors.white, bg = colors.none },
    NavicSeparator = { bg = colors.none },

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
    NvimTreeWinSeparator = { fg = "#2d3139", bg = colors.none, link = "" },
    NvimTreeOpenedHL = { fg = colors.blue },

    -- helpview
    HelpviewCode = { bg = colors.bg2 },

    -- snanks
    SnacksPickerBorder = { fg = colors.black },
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
    -- -- vim-visual-multi
    -- VM_Mono = { link = "DiffText" },
    -- VM_Extend = { link = "DiffAdd" },
    -- VM_Cursor = { link = "Visual" },
    -- VM_Insert = { link = "DiffChange" },

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

    -- fugit2
    Fugit2FloatTitle = { fg = colors.orange },
    Fugit2MenuHead = { fg = colors.magenta },
    Fugit2Heading = { fg = colors.magenta },
    Fugit2Header = { fg = colors.red },
    Fugit2Hash = { fg = colors.yellow },
    Fugit2BlameDate = { fg = colors.green },
    Fugit2GraphDate = { fg = colors.green },
    Fugit2Author = { fg = colors.blue },
    Fugit2BranchHead = { fg = colors.magenta },
    Fugit2ObjectId = { fg = colors.yellow },
    Fugit2Branch1 = { fg = colors.red },
    Fugit2Branch2 = { fg = colors.orange },
    Fugit2Branch3 = { fg = colors.yellow },
    Fugit2Branch4 = { fg = colors.green },
    Fugit2Branch5 = { fg = colors.blue },
    Fugit2Branch6 = { fg = colors.cyan },
    Fugit2Branch7 = { fg = colors.magenta },
    Fugit2Branch8 = { fg = colors.red },
    Fugit2Branch9 = { fg = colors.orange },
    Fugit2Tag1 = { bg = colors.red, fg = colors.black },
    Fugit2Tag2 = { bg = colors.orange, fg = colors.black },
    Fugit2Tag3 = { bg = colors.yellow, fg = colors.black },
    Fugit2Tag4 = { bg = colors.green, fg = colors.black },
    Fugit2Tag5 = { bg = colors.blue, fg = colors.black },
    Fugit2Tag6 = { bg = colors.cyan, fg = colors.black },
    Fugit2Tag7 = { bg = colors.magenta, fg = colors.black },
    Fugit2Tag8 = { bg = colors.maroon, fg = colors.black },
    Fugit2Tag9 = { bg = colors.forest, fg = colors.black },
    -- Fugit2AuthorEmail = "Label",
    -- Fugit2HelpHeader = "Label",
    -- Fugit2HelpTag = "Tag",
    -- Fugit2UntrackedHeading = "PreCondit",
    -- Fugit2UnstagedHeading = "Macro",
    -- Fugit2StagedHeading = "Include",
    -- Fugit2MessageHeading = "diffAdded",
    -- Fugit2Modifier = "Type",
    -- Fugit2Ignored = "Ignore",
    -- Fugit2Unstaged = "diffRemoved",
    -- Fugit2Staged = "diffAdded",
    -- Fugit2Modified = "Constant",
    -- Fugit2Unchanged = "",
    -- Fugit2Untracked = "Error",
    -- Fugit2Instruction = "Type",
    -- Fugit2Stop = "Function",
    -- Fugit2SymbolicRef = "Function",
    -- Fugit2Count = "Number",
    -- Fugit2Insertions = "diffAdded",
    -- Fugit2Deletions = "diffRemoved",
    -- Fugit2Match = "Type",
    -- Fugit2WindowHelp = "Comment",
    -- Fugit2MenuKey = "PreProc",
    -- Fugit2MenuArgOff = "Comment",
    -- Fugit2MenuArgOn = "Number",
    -- Fugit2FloatTitle = "@parameter",
    -- Fugit2RebasePick = "diffAdded", -- green
    -- Fugit2RebaseDrop = "diffRemoved", -- red
    -- Fugit2RebaseSquash = "Type", -- yellow
    -- Fugit2BlameBorder = "Comment",

    -- git-graph
    GitGraphHash = { fg = colors.yellow },
    GitGraphTimestamp = { fg = colors.green },
    GitGraphAuthor = { fg = colors.blue },
    GitGraphBranchName = { fg = colors.red },
    GitGraphBranchTag = { fg = colors.magenta },
    GitGraphBranchMsg = { fg = colors.white },
    GitGraphBranch1 = { fg = colors.red },
    GitGraphBranch2 = { fg = colors.orange },
    GitGraphBranch3 = { fg = colors.yellow },
    GitGraphBranch4 = { fg = colors.green },
    GitGraphBranch5 = { fg = colors.blue },

    -- nui
    NuiComponentsTreeNodeFocused = {
      bg = colors.bg,
    },
    NuiComponentsSelectNodeFocused = {
      bg = colors.bg,
    },
    NuiComponentsSelectOption = {
      fg = colors.fg,
    },
    NuiComponentsSelectOptionSelected = {
      fg = colors.fg,
    },
    NuiComponentsSelectSeparator = {
      fg = colors.yellow,
    },
    NuiComponentsButtonActive = {
      fg = colors.red,
      bg = colors.green,
    },
    NuiComponentsButtonFocused = {
      fg = colors.red,
      bg = colors.yellow,
    },
    NuiComponentsCheckboxLabel = {
      fg = colors.bg,
    },
    NuiComponentsCheckboxLabelChecked = {
      fg = colors.red,
    },
    NuiComponentsCheckboxIconChecked = {
      fg = colors.red,
    },
    -- Spectre
    NuiComponentsTreeSpectreIcon = {
      fg = colors.bg,
    },
    -- NuiComponentsTreeSpectreFileName = {
    --   fg = colors.dark["50"]
    -- },
    NuiComponentsTreeSpectreCodeLine = {
      fg = colors.bg,
      bg = colors.none,
    },
    NuiComponentsTreeSpectreSearchValue = {
      fg = colors.bg,
      bg = colors.bg2,
    },
    NuiComponentsTreeSpectreSearchOldValue = {
      fg = colors.bg,
      bg = colors.red,
      strikethrough = true,
    },
    NuiComponentsTreeSpectreSearchNewValue = {
      fg = colors.bg,
      bg = colors.green,
    },
    NuiComponentsTreeSpectreReplaceSuccess = {
      fg = colors.green,
    },
    NuiComponentsBorderLabel = { fg = colors.bg, bg = colors.red },

    -- nvim-bqf
    BqfPreviewFloat = { bg = colors.bg2 },
    BqfPreviewBorder = { bg = colors.bg2, fg = colors.bg2 },
    BqfPreviewTitle = { bg = colors.orange, fg = colors.black },
    -- BqfPreviewThumb = {},
    -- BqfPreviewSbar = {},
    -- BqfPreviewCursor = {},
    -- BqfPreviewCursorLine = {},
    -- BqfPreviewRange = {},
    -- BqfPreviewBufLabel = {},
    -- BqfSign = {},
    qfLineNr = { fg = colors.yellow },

    -- helpview
    HelpviewPalette0 = { bg = colors.cyan, fg = colors.black },
    HelpviewPalette1 = { bg = colors.red, fg = colors.black },
    HelpviewPalette2 = { bg = colors.orange, fg = colors.black },
    HelpviewPalette3 = { bg = colors.yellow, fg = colors.black },
    HelpviewPalette4 = { bg = colors.green, fg = colors.black },
    -- HelpviewPalette5 = { bg = colors.blue, fg = colors.black },
    HelpviewPalette6 = { bg = colors.magenta, fg = colors.black },
    HelpviewPalette0Sign = { fg = colors.cyan },
    HelpviewPalette1Sign = { fg = colors.red },
    HelpviewPalette2Sign = { fg = colors.orange },
    HelpviewPalette3Sign = { fg = colors.yellow },
    HelpviewPalette4Sign = { fg = colors.green },
    HelpviewPalette5Sign = { fg = colors.blue },
    HelpviewPalette6Sign = { fg = colors.magenta },
    HelpviewPalette7Sign = { fg = colors.tangerine },
    HelpviewIcon0 = { fg = colors.cyan },
    HelpviewIcon1 = { fg = colors.red },
    HelpviewIcon2 = { fg = colors.orange },
    HelpviewIcon3 = { fg = colors.yellow },
    HelpviewIcon4 = { fg = colors.green },
    HelpviewIcon5 = { fg = colors.blue },
    HelpviewIcon6 = { fg = colors.magenta },

    -- notify.nvim
    NotifyERRORBorder = { fg = colors.maroon },
    NotifyWARNBorder = { fg = colors.mustard },
    NotifyINFOBorder = { fg = colors.forest },
    NotifyDEBUGBorder = { fg = colors.navy },
    NotifyTRACEBorder = { fg = colors.plum },
    NotifyERRORIcon = { fg = colors.red },
    NotifyWARNIcon = { fg = colors.yellow },
    NotifyINFOIcon = { fg = colors.green },
    NotifyDEBUGIcon = { fg = colors.blue },
    NotifyTRACEIcon = { fg = colors.magenta },
    NotifyERRORTitle = { fg = colors.red },
    NotifyWARNTitle = { fg = colors.yellow },
    NotifyINFOTitle = { fg = colors.green },
    NotifyDEBUGTitle = { fg = colors.blue },
    NotifyTRACETitle = { fg = colors.magenta },

    --markview
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

    --snacks
    SnacksNotifierFooterInfo = { fg = colors.green },
    SnacksNotifierBorderInfo = { fg = colors.green },
    SnacksNotifierTitleInfo = { fg = colors.green },
    SnacksNotifierIconInfo = { fg = colors.green },

    --kulala
    KulalaText = { bg = colors.green, fg = colors.black },
  },
}
