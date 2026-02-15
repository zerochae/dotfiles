return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    { "junegunn/fzf.vim", lazy = true },
  },
  opts = {
    preview = {
      show_title = true,
      winblend = 0,
    },
  },
}
