local present, lspsaga = pcall(require, "lspsaga")

if not present then
  return
end

lspsaga.setup {
  symbol_in_winbar = {
    enable = false,
    separator = "  ›  ",
  },
  lightbulb = {
    enable = false,
  },
}
