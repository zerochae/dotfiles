local present, neorg = pcall(require, "neorg")

if not present then
  return
end

neorg.setup {
  load = {
    -- default module
    ["core.defaults"] = {},
    ["core.esupports.metagen"] = {
      config = {
        type = "auto",
      },
    },
    ["core.journal"] = {
      config = {
        strategy = "flat",
      },
    },

    -- other
    ["core.concealer"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.ui"] = {},
    ["core.ui.calendar"] = {},
    ["core.integrations.telescope"] = {
      config = {
        insert_file_link = {
          show_title_preview = true,
        },
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          note = "~/Dev/note",
          archives = "~/Dev/note/archives",
          areas = "~/Dev/note/areas",
          daily = "~/Dev/note/daily",
          journal = "~/Dev/note/journal",
          presentation = "~/Dev/note/presentation",
          projects = "~/Dev/note/projects",
          resources = "~/Dev/note/resources",
        },
        default_workspace = "note",
      },
    },
  },
}

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
