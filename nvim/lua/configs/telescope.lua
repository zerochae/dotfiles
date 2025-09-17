local function telescope_dynamic_layout_strategies()
  local layout_strategies = require "telescope.pickers.layout_strategies"

  layout_strategies.dynamic = function(self, max_columns, max_lines, layout_config)
    if vim.o.columns > 160 then
      return layout_strategies.horizontal(self, max_columns, max_lines, layout_config)
    else
      return layout_strategies.vertical(self, max_columns, max_lines, layout_config)
    end
  end
end

telescope_dynamic_layout_strategies()

return {
  defaults = {
    results_title = " Finder",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    layout_strategy = "dynamic",
    sorting_strategy = "descending",
    height = 0.8,
    width = 0.8,
    preview = {
      filesize_limit = 0.5555,
    },
    layout_config = {
      preview_cutoff = 10,
      vertical = {
        prompt_position = "bottom",
        preview_cutoff = 30,
      },
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.6,
        preview_cutoff = 110,
      },
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
  },
  extensions = {
    file_browser = {
      dir_icon_hl = "DiagnosticWarn",
    },
  },
}
