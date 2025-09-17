vim.treesitter.language.register("bash", "dotenv")
vim.treesitter.language.register("markdown", "mdx")

local ft_to_lang = require("nvim-treesitter.parsers").ft_to_lang

require("nvim-treesitter.parsers").ft_to_lang = function(ft)
  if ft == "zsh" then
    return "bash"
  end
  return ft_to_lang(ft)
end

require("nvim-treesitter.parsers").ft_to_lang = function(ft)
  if ft == "handlebars" then
    return "tsx"
  end
  return ft_to_lang(ft)
end

return {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "sql",
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
  },
  -- context_commentstring = {
  --   enable = true,
  -- },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
}
