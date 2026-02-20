local pad = { " ", " ", " ", " ", " ", " ", " ", " " }

local main_layout = {
  layout = {
    box = "horizontal",
    backdrop = false,
    width = 0.8,
    height = 0.8,
    border = "single",
    {
      box = "vertical",
      { win = "list", border = pad },
      { win = "input", height = 1, border = pad, title = "{title} {flags}", title_pos = "center" },
    },
    { win = "preview", title = " Preview", title_pos = "center", border = pad, width = 0.5 },
  },
}

local exclude_patterns = {
  "node_modules",
  ".git",
  ".DS_Store",
  "*.png",
  "*.svg",
  "*.mp4",
  "*.jpg",
  "*.jpeg",
  "*.bundle.js",
  "*.mjs",
  "*.cjs",
}

local sources = {
  files = {
    title = " Files",
    hidden = false,
    ignored = false,
    exclude = exclude_patterns,
  },
  grep = {
    title = " Grep",
    hidden = false,
    ignored = false,
    regex = false,
    exclude = exclude_patterns,
  },
  recent = { title = "󰋚 Recent" },
  buffers = { title = "󰈚 Buffers" },
  help = { title = "󰛵 Help" },
  lines = { title = "󰗈 Lines" },
  git_status = { title = " Git Status" },
  git_branches = { title = " Branches" },
  git_log = { title = " Git Log" },
  qflist = { title = " Quickfix" },
  projects = { title = " Projects" },
  commands = { title = " Commands" },
  keymaps = { title = "󰌌 Keymaps" },
  diagnostics = { title = " Diagnostics" },
  lsp_references = { title = " References" },
  lsp_definitions = { title = " Definitions" },
  lsp_implementations = { title = " Implementations" },
  lsp_type_definitions = { title = "󰊄 Type Definitions" },
  lsp_symbols = { title = " Symbols" },
  lsp_workspace_symbols = { title = " Workspace Symbols" },
  marks = { title = "󰃀 Marks" },
  registers = { title = " Registers" },
  colorschemes = { title = " Colorschemes" },
  highlights = { title = "󰸱 Highlights" },
  git_diff = { title = " Git Diff" },
  git_stash = { title = "󰏗 Git Stash" },
  resume = { title = "󰁯 Resume" },
  undo = { title = "󰕌 Undo" },
  notifications = { title = "󰂚 Notifications" },
  pickers = { title = " Pickers" },
}

for _, source in pairs(sources) do
  source.layout = main_layout
end

sources.explorer = {
  prompt = " ",
  -- prompt = "  ",
  hidden = true,
  ignored = true,
  filter = {
    filter = function(item, filter)
      if item.ignored and not filter:is_empty() then
        return false
      end
      return true
    end,
  },
  format = function(item, picker)
    local ret = Snacks.picker.format.file(item, picker)
    if not item.parent and item.dir then
      for i, entry in ipairs(ret) do
        if entry.virtual then
          ret[i][1] = Snacks.picker.util.align("", picker.opts.formatters.file.icon_width or 2)
          ret[i][2] = "SnacksPickerRoot"
          break
        end
      end
    end
    return ret
  end,
  layout = {
    preview = "main",
    layout = {
      backdrop = false,
      width = 40,
      min_width = 40,
      height = 0,
      position = "left",
      border = "none",
      box = "vertical",
      { win = "input", height = 1, border = "none" },
      { win = "list", border = "none" },
    },
  },
  icons = {
    files = {
      enabled = true,
      dir = "󰉋",
      dir_open = "󰝰",
      file = "󰈔",
    },
    git = {
      enabled = true,
      staged = "",
      added = "",
      deleted = "",
      ignored = "",
      modified = "",
      renamed = "",
      unmerged = "",
      untracked = "",
      commit = "󰜘",
    },
    tree = {
      vertical = "│ ",
      middle = "├╴",
      last = "└╴",
    },
  },
  win = {
    input = {
      wo = { winbar = "" },
      keys = {
        ["<Esc>"] = { "focus_list", mode = { "n", "i" } },
      },
    },
    list = {
      wo = { number = false, relativenumber = false, winbar = "" },
      keys = {
        ["<C-n>"] = "close",
        ["<c-t>"] = false,
      },
    },
  },
}

local config = {
  image = {},
  layout = {},
  indent = { enabled = false },
  input = {
    enabled = true,
    win = {
      keys = {
        i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
      },
    },
  },
  terminal = {
    win = {
      wo = { number = false, relativenumber = false },
    },
  },
  explorer = {
    replace_netrw = true,
  },
  picker = {
    previewers = {
      diff = {
        style = "terminal",
      },
    },
    win = {
      preview = {
        wo = { fillchars = "eob: ", wrap = false, winbar = " " },
      },
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
        },
      },
    },
    sources = sources,
  },
  lazygit = {
    configure = false,
  },
  notifier = {
    enabled = true,
    timeout = 3000,
    width = { min = 40, max = 0.4 },
    height = { min = 1, max = 0.6 },
    margin = { top = 0, right = 1, bottom = 0 },
    padding = true,
    sort = { "level", "added" },
    level = vim.log.levels.TRACE,
    icons = {
      error = "",
      warn = "",
      info = "",
      debug = "",
      trace = "",
    },
    style = "compact",
    top_down = false,
    date_format = "%R",
    refresh = 50,
  },
  bigfile = {
    notify = true,
    size = 1.5 * 1024 * 1024,
    line_length = 1000,
    setup = function(ctx)
      if vim.fn.exists ":NoMatchParen" ~= 0 then
        vim.cmd [[NoMatchParen]]
      end
      Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
      vim.b.minianimate_disable = true
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ctx.buf) then
          vim.bo[ctx.buf].syntax = ctx.ft
        end
      end)
    end,
  },
}

return {
  "folke/snacks.nvim",
  lazy = false,
  config = function()
    require("snacks").setup(config)
    local original_icon = Snacks.util.icon
    Snacks.util.icon = function(name, cat, icon_opts)
      if cat == "file" and name then
        name = vim.fs.basename(name)
      end
      return original_icon(name, cat, icon_opts)
    end
  end,
}
