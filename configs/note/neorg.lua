local present, neorg = pcall(require, "neorg")

if not present then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        default_workspace = "work",
        workspaces = {
          work = "~/Dev/note/work",
          home = "~/Dev/note/home",
        },
      },
    },
  },
}
