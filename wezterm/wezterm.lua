local wezterm = require "wezterm"

local fonts = require "fonts"
local colors = require "colors"
local keys = require "keys"

local config = {}

config.color_scheme = "OneDark (base16)"
config.bold_brightens_ansi_colors = true
config.colors = colors
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 1000
config.force_reverse_video_cursor = true
config.font = wezterm.font_with_fallback(fonts)
config.font_size = 18
config.line_height = 1.4
config.cell_width = 1
config.front_end = "OpenGL"
config.anti_alias_custom_block_glyphs = true
config.freetype_load_flags = "NO_AUTOHINT"
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 0.9,
}
config.tab_max_width = 1200
config.window_frame = {
  font_size = 16.0,
  active_titlebar_bg = "#1a1a26",
}
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 25
config.window_background_opacity = 0.85
config.window_padding = {
  left = 30,
  right = 30,
  top = 30,
  bottom = 20,
}
config.window_close_confirmation = "NeverPrompt"
config.enable_scroll_bar = false
config.keys = keys

return config
