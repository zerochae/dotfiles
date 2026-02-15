return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    filetypes = {
      "*",
      "!lazy",
      cmp_docs = {
        always_update = true,
      },
    },
    user_default_options = {
      RGB = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      css = true,
      tailwind = true,
      always_update = true,
      names = false,
      mode = "background",
      virtualtext = "■",
    },
  },
}
