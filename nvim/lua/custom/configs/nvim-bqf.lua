local present, bqf = pcall(require, "bqf")

if not present then
  return
end

bqf.setup {
  preview = {
    show_title = true,
    winblend = 10,
  },
}
