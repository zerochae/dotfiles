local colors = require "ui.assets.colors"

return {
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
  NuiComponentsBorderLabel = {
    fg = colors.bg,
    bg = colors.red,
  },
}
