return {
  scope = {
    enabled = true, -- show_current_context and show_current_context_start
    show_start = true,
    show_end = false,
  },
  indent = {
    char = " ", -- or "│"
    -- context_char = "┃",
  },
  exclude = {
    buftypes = { "terminal", "dbui" }, -- buftype_exclude
  },
  whitespace = {
    remove_blankline_trail = true, -- show_trailing_blankline_indent
  },
}
