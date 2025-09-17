local present, foldtext = pcall(require, "foldtext")

if not present then
  return
end

foldtext.setup {
  ignore_buftypes = {},
  ignore_filetypes = {},
  styles = {
    default = {
      {
        kind = "indent",
        hl = "@comment",
      },
      {
        condition = function()
          return false
        end,
        kind = "fold_size",
        hl = "@comment",
        -- icon = "←→ ",
        -- icon_hl = nil,
        -- padding_left = " ",
        -- padding_left_hl = nil,
        -- padding_right = " ",
        -- padding_right_hl = nil,
      },
      {
        kind = "bufline",
        delimiter = "  ",
        hl = "@comment",
      },
      {
        kind = "section",
        output = function(_, window)
          local width = vim.api.nvim_win_get_width(window)
          local textoff = vim.fn.getwininfo(window)[1].textoff

          width = width - textoff

          local size = (vim.v.foldend - vim.v.foldstart) + 1

          return {
            { "  ", "@comment" },
            { tostring(size), "@comment" },
            { " lines ", "@comment" },
            { " 󰘕 ", "@comment" },
          }
        end,
      },
    },
    expr = {
      condition = function(win)
        return vim.wo[win].foldmethod == "expr"
      end,
      parts = {},
    },
  },
}
