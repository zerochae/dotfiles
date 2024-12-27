if not vim.g.neovide then
  return
end

------------------------------ font ------------------------------

vim.opt.linespace = 10
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

------------------------------ ui  ------------------------------

local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
vim.g.neovide_transparency = 0.5
vim.g.transparency = 0.9
vim.g.neovide_background_color = "#3f3f5b" .. alpha()
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.g.neovide_show_border = true

vim.g.neovide_window_floating_opacity = 1
vim.g.neovide_floating_blur = 1
vim.g.neovide_window_floating_blur = 1

local neovide_multi_grid = os.getenv "NEOVIDE_NO_MULTIGRID" == "false"
vim.o.pumblend = neovide_multi_grid and 100 or 0
vim.o.winblend = neovide_multi_grid and 100 or 0

vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = true
vim.g.neovide_confirm_quit = true
vim.g.neovide_input_use_logo = true

vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_speed = 20.0

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_cursor_animation_length = 0.13
