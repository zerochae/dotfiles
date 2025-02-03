local present, markview = pcall(require, "markview")

if not present then
  return
end

local presets = require "markview.presets"

markview.setup {
  markdown = {
    headings = presets.headings.glow,
    -- horizontal_rules = presets.horizontal_rules.arrowed,
    tables = presets.tables.single,
  },
}
