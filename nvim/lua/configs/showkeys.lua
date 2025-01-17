local present, showkeys = pcall(require, "showkeys")

if not present then
  return
end

showkeys.setup {
  timeout = 1,
  maxkeys = 1,
  keyformat = {
    ["<Esc>"] = "ESC",
    ["<M>"] = "󰘵",
    ["<C>"] = "󰘴",
    ["<CR>"] = "󰌑",
    ["<BS>"] = "󰌍",
  },
  winopts = {
    border = "none",
  },
  auto_open = "enabled",
}
