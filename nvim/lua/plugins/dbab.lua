return {
  "zerochae/dbab.nvim",
  cmd = { "Dbab" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "tpope/vim-dadbod",
  },
  opts = {
    executor = "cli",
    connections = {
      {
        name = os.getenv("DBAB_CONNECTION1_NAME") or "",
        url = os.getenv("DBAB_CONNECTION1_URL") or "",
      },
      {
        name = os.getenv("DBAB_CONNECTION2_NAME") or "",
        url = os.getenv("DBAB_CONNECTION2_URL") or "",
      },
    },
    layout = "wide",
    sidebar = {
      use_brand_icon = true,
      show_brand_name = true,
    },
    history = {
      on_select = "execute",
      persist = true,
      filter_by_connection = true,
      query_display = "auto",
      style = "detailed",
    },
    result = {
      style = "table",
      show_line_number = false,
      header_align = "full",
    },
  },
}
