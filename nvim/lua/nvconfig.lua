local highlights = require "highlights"
local statusline = require "ui.statusline.modules"
local tabufline = require "ui.tabufline.modules"

---@type ChadrcConfig
local config = {
  base46 = {
    theme = "onedark", -- default theme
    hl_override = highlights.override,
    hl_add = highlights.add,
    integrations = { "hop", "navic" },
    changed_themes = {},
    transparency = true,
    theme_toggle = { "onedark", "one_light" },
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "default", -- default/vscode/vscode_colored/minimal
      separator_style = "block",
      order = {
        "tree_off_set",
        "mode",
        "filetype",
        "git",
        "%=",
        "navic",
        "qf",
        "%=",
        "diagnostics",
        "lsp",
        "cwd",
        "cursor",
      },
      modules = {
        tree_off_set = statusline.tree_off_set,
        mode = statusline.mode,
        filetype = statusline.filetype,
        git = statusline.git,
        lsp_loader = statusline.lsp_loader,
        diagnostics = statusline.diagnostics,
        lsp = statusline.lsp,
        cursor = statusline.cursor,
        navic = statusline.get_location_v2,
        qf = statusline.qf,
      },
    },

    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs" },
      modules = {
        buffers = tabufline.buffers,
      },
      bufwidth = 21,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = require("ui.assets.ascii.neovim").n,
    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")

return vim.tbl_deep_extend("force", config, status and chadrc or {})
