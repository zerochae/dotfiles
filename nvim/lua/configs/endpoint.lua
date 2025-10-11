return {
  cache = {
    mode = "session",
  },
  picker = {
    type = "snacks",
    options = {
      telescope = {
        prompt_title = "Endpoints:: ",
      },
      snacks = {
        prompt = "EndPoints:: ",
        preview_title_format = "absolute"
      },
      vim_ui_select = {
        prompt = "EndPoints:: ",
      },
    },
    previewer = {
      enable_highlighting = true,
    },
  },
  frameworks = {
    rails = {
      show_action = true,
    },
    django = {
      url_param_format = "%t:%v",
      url_param_fallback = "%v",
      url_param_brackets = "<>",
    },
  },
  ui = {
    show_icons = false,
    show_method = true,
    methods = {
      GET = { icon = "▼", color = "TextGreen" },
      POST = { icon = "▲", color = "TextBlue" },
      PUT = { icon = "◆", color = "TextYellow" },
      DELETE = { icon = "✖", color = "TextRed" },
      PATCH = { icon = "◉", color = "TextMagenta" },
      ROUTE = { icon = "󰎚", color = "TextGreen" },
      QUERY = { icon = "◉", color = "TextOrange" },
      MUTATION = { icon = "✖", color = "TextCyan" },
    },
  },
}
