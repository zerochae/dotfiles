local present, workspaces = pcall(require, "workspaces")

if not present then
  return
end

workspaces.setup {
  hooks = {
    open = { "Telescope find_files" },
  },
}
