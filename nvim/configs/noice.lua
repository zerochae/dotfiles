local present, noice = pcall(require, "noice")

if not present then
  return
end

vim.opt.shortmess:append "IWs"

noice.setup {
  cmdline = {
    enabled = true,
    format = {
      cmdline = {
        pattern = "^:",
        icon = " ",
        lang = "vim",
        title = "",
        icon_hl_group = "NoiceCmdlineIcon",
      },
      filter = {
        pattern = "^:!",
        icon = " ",
        lang = "sh",
        title = " bash ",
        icon_hl_group = "NoiceCmdlineBashIcon",
      },
      help = {
        pattern = "^:%s*he?l?p?%s+",
        icon = " ",
        lang = "vim",
        title = " help ",
        icon_hl_group = "NoiceCmdlineHelpIcon",
      },
      replace = {
        pattern = "^:s/",
        icon = " ",
        lang = "regex",
        title = " Replace ",
        icon_hl_group = "NoiceCmdlineReplaceIcon",
      },
      replace_all = {
        pattern = "^:%%s/",
        icon = " ",
        lang = "regex",
        title = " Replace All ",
        icon_hl_group = "NoiceCmdlineReplaceIcon",
      },
      highlight = {
        pattern = { "^:hi ", "^:highlight " },
        icon = " ",
        lang = "vim",
        title = " Highlight ",
        icon_hl_group = "NoiceCmdlineHlIcon",
      },
      map = {
        pattern = "^:map ",
        icon = " ",
        lang = "vim",
        title = " Map ",
        icon_hl_group = "NoiceCmdlineMapIcon",
      },
      calculator = {
        pattern = "^:=",
        icon = " ",
        lang = "vimnormal",
        title = " Calculator ",
        icon_hl_group = "NoiceCmdlineCalculatorIcon",
      },
      lua = {
        pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
        icon = " ",
        lang = " lua ",
        icon_hl_group = "DevIconLua",
      },
    },
  },
  views = {
    cmdline_input = {
      relative = "cursor",
      anchor = "auto",
      position = { row = 2, col = 2 },
      size = {
        min_width = 20,
        width = "auto",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 50,
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 50,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
      },
    },
    mini = {
      timeout = 3000,
      border = {
        style = "rounded",
      },
      win_options = {
        winblend = 0,
        winhighlight = { Normal = "Normal" },
      },
    },
    confirm = {
      zindex = 1000,
    },
  },
  messages = {
    enabled = true,
    view = "mini",
    vie_info = "mini",
    view_error = "mini",
    view_warn = "mini",
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
      silent = true,
    },
    signature = {
      enabled = false,
    },
    messages = {
      enabled = false,
    },
  },
  notify = {
    view = "mini",
    enabled = false,
  },
  routes = {
    {
      filter = {
        event = { "msg_show", "notify" },
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
          { find = "^[C]: in function 'nvim_open_win'" },
          { find = "'width' key must be a positive Integer" },
          { find = "Vim:E444: Cannot clos" },
          { find = "response of request method textDocument/definition is empty" },
          { find = "Error executing vim.schedule lua callback" },
          { find = "E21: Cannot make changes, 'modifiable' is off" },
          { find = "No information" },
          { find = "No code actions available" },
          {
            find = "method textDocument/codeAction is not supported by any of the servers registered for the current buffer",
          },
          { find = "no manual entry for" },
          { find = "No matching notification found to replace" },
          { find = "Already at oldest change" },
          { find = "Already at newest change" },
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
