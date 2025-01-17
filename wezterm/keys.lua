local wezterm = require "wezterm"

return {
  {
    key = "d",
    mods = "CTRL",
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = "=",
    mods = "CMD",
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = "-",
    mods = "CMD",
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = "t",
    mods = "CMD",
    action = wezterm.action.SpawnTab "DefaultDomain",
  },
}
