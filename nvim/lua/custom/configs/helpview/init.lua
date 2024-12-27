local present, helpview = pcall(require, "helpview")

if not present then
  return
end

helpview.setup {
  headings = require "custom.configs.helpview.headings",
  code_blocks = require "custom.configs.helpview.code_blocks",
  highlight_groups = require "custom.configs.helpview.highlight_groups",
}
