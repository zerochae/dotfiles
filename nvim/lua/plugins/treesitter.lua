vim.treesitter.language.register("bash", "dotenv")
vim.treesitter.language.register("bash", "zsh")
vim.treesitter.language.register("markdown", "mdx")

local ft_to_lang = require("nvim-treesitter.parsers").ft_to_lang

require("nvim-treesitter.parsers").ft_to_lang = function(ft)
  if ft == "handlebars" then
    return "tsx"
  end
  return ft_to_lang(ft)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = {
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
      indent = { enable = true },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      rainbow = {
        enable = true,
        query = "rainbow-parens",
      },
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
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { enable_autocmd = false },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    opts = {
      filetypes = {
        "html",
        "javascriptreact",
        "javascript",
        "typescript",
        "typescriptreact",
        "tsx",
        "jsx",
        "vue",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
  },
}
