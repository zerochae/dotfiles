local status, spectre = pcall(require, "spectre")

if not status then
  return
end

spectre.setup {
  replace_engine = {
    ["sed"] = {
      cmd = "sed",
      args = {
        "-i",
        "",
        "-E",
      },
    },
  },
}
