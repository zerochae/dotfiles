local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup {
  background_colour = "#000000",
  minimum_width = 40,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 2000 })
  end,
}
