local present, neorg = pcall(require, "neorg")

if not present then
  return
end

neorg.setup {
  load = {
    ["core.integrations.nvim-cmp"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.completion"] = {
      config = { engine = "nvim-cmp" },
    },
    ["core.highlights"] = {},
    ["core.defaults"] = {},

    ["core.concealer"] = {
      config = {
        folds = false,
      },
    },
    ["core.dirman"] = {
      config = {
        default_workspace = "note",
        workspaces = {
          note = "~/Dev/note",
          projects = "~/Dev/note/projects/",
          areas = "~/Dev/note/areas",
          resources = "~/Dev/note/resources/",
          archives = "~/Dev/note/archives",
        },
        use_popup = true,
      },
    },
  },
}
