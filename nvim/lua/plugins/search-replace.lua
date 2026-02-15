return {
  "roobert/search-replace.nvim",
  event = "BufReadPost",
  opts = {
    default_replace_single_buffer_options = "gcI",
    default_replace_multi_buffer_options = "egcI",
  },
}
