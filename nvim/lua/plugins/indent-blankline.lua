return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User FilePost",
  config = function()
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    require("ibl").setup {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        char = "▎",
      },
      indent = {
        char = "┊",
      },
      exclude = {
        buftypes = { "terminal", "dbui", "snacks_picker_preview", "snacks" },
      },
      whitespace = {
        remove_blankline_trail = true,
      },
    }
  end,
}
