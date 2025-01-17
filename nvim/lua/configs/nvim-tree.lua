local function float_nvim_tree_view()
  return {
    float = {
      enable = true,
      open_win_config = function()
        local ratio = 0.8
        local rows = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local cols = vim.opt.columns:get()
        local height = math.floor(rows * ratio)
        local width = math.floor(cols * ratio)
        local center_x = math.floor((cols - width) / 2)
        local center_y = math.floor(((vim.opt.lines:get() - height) / 2) - vim.opt.cmdheight:get())

        return {
          relative = "editor",
          border = "single",
          width = width,
          height = height,
          row = center_y,
          col = center_x,
        }
      end,
    },
  }
end

return {
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
    width = function()
      local ratio = 0.25
      local cols = vim.opt.columns:get()
      local width = math.floor(cols * ratio)

      local max_width = 35

      if cols < 153 then
        max_width = 30
      end

      return math.max(width, max_width)
    end,
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
}
