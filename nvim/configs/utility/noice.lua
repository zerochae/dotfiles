local present, noice = pcall(require, "noice")

if not present then
  return
end

vim.opt.shortmess:append "IWs"

local rows = vim.opt.lines:get() - vim.opt.cmdheight:get()
local cols = vim.opt.columns:get()
local height = math.floor(rows)
local width = math.floor(cols)
local center_x = math.floor((cols - width) / 2)
local center_y = math.floor(((vim.opt.lines:get() - height) / 2) - vim.opt.cmdheight:get())

noice.setup {
  cmdline = {
    enabled = true,
    format = {
      cmdline = { pattern = "^:", icon = ">_", lang = "vim", title = "" },
      replace = { pattern = "^:s/", icon = " ", lang = "regex", title = "Replace" },
      replace_all = { pattern = "^:%%s/", icon = " ", lang = "regex", title = "Replace All" },
      highlight = { pattern = { "^:hi ", "^:highlight " }, icon = " ", lang = "vim", title = "Highlight" },
      map = { pattern = "^:map ", icon = " ", lang = "vim", title = "Map" },
      calculator = { pattern = "^:=", icon = " ", lang = "vimnormal", title = "Calculator" },
      lua = { pattern = "^:lua ", icon = " ", lang = "lua", title = "lua" },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = 25,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 28,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
    confirm = {
      zindex = 1000,
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_search = "virtualtext",
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    messages = {
      enabled = false,
    },
  },
  notify = {
    enabled = false,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
          { find = "%d fewer lines" },
          { find = "%d more lines" },
          { find = "E486: Pattern not found: (.+)" },
          { find = "^/([^/]+)$" },
          { find = "%d lines yanked" },
          { find = "^table: 0x[0-9a-fA-F]+$" },
          { find = "^%d+ substitutions on %d+ lines$" },
          { find = "^No matching notification found to replace$" },
        },
      },
      opts = { skip = true },
    },
    {
      view = "popup",
      filter = { min_height = 20 },
      opts = { lang = "lua" },
    },
  },
  smart_move = {
    enabled = true, -- you can disable this behaviour here
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}
