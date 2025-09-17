return {
  cache = {
    mode = "none",
  },
  picker = {
    type = "telescope",
    options = {
      telescope = {
        prompt_title = "Endpoints:: ",
      },
      snacks = {
        prompt = "EndPoints:: ",
      },
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
      LIST = { icon = "▼", color = "TextGreen" },
      CREATE = { icon = "▲", color = "TextBlue" },
      RETRIEVE = { icon = "▼", color = "TextGreen" },
      UPDATE = { icon = "◆", color = "TextYellow" },
      PARTIAL_UPDATE = { icon = "◉", color = "TextMagenta" },
      DESTROY = { icon = "✖", color = "TextRed" },
    },
  },
}
