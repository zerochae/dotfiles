local present, lspsaga = pcall(require, "lspsaga")

if not present then
  return
end

lspsaga.setup {
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    enable = false,
  },
  hover = {
    max_height = 0.5,
    max_width = 0.8,
  },
  outline = {
    layout = "normal",
    left_width = 0.3,
  },
  ui = {
    lines = { "", "", "", "", "" },
    colors = {
      normal_bg = "NONE",
      title_bg = "NONE",
    },
  },
}
