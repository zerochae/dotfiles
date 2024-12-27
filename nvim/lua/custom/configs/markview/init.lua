local present, markview = pcall(require, "markview")

if not present then
  return
end

markview.setup {
  modes = { "n", "v" },
  headings = require "custom.configs.markview.headings",
  code_blocks = require "custom.configs.markview.code_blocks",
  tables = require "custom.configs.markview.tables",
  list_items = require "custom.configs.markview.list_items",
  checkboxes = require "custom.configs.markview.checkboxes",
  highlight_groups = require "custom.configs.markview.highlight_groups",
}
