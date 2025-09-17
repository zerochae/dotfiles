local present, search_replace = pcall(require, "search-replace")

if not present then
  return
end

search_replace.setup {
  default_replace_single_buffer_options = "gcI",
  default_replace_multi_buffer_options = "egcI",
}
