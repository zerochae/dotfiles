local utils = require "ui.nvim-tree.utils"

return {
  -- on_attach = on_attach,
  git = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = {
      "^.null-ls_",
    },
  },
  view = {
    side = "left",
    width = utils.dynamic_nvim_tree_width(),
  },
  sort = {
    sorter = "case_sensitive",
  },
  renderer = {
    highlight_opened_files = "none",
    group_empty = true,
    special_files = {},
    -- root_folder_label = false,
    root_folder_label = function(path)
      local label = " " .. vim.fn.fnamemodify(path, ":t")
      local padding = vim.fn.winwidth(0) - #label
      if padding > 0 then
        return label .. string.rep(" ", padding)
      else
        return label
      end
    end,
    highlight_git = true,
    indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        },
      },
      show = {
        git = false,
      },
      padding = " ",
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = " ",
          arrow_closed = " ",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "✎",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  actions = {
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "rounded",
        style = "minimal",
      },
    },
  },
}
