return {
  browser = {
    type = "chrome",
    debug_port = 9222,
    url = "http://localhost:4000",
    arc_mode = "little",
  },
  ui = {
    window = {
      width = 100,
      height = 25,
      position = "right",
    },
    console = {
      max_lines = 1000,
      auto_scroll = true,
      timestamp = true,
    },
  },
}
