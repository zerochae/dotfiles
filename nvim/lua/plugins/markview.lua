local function generic_hl(group)
  return {
    ["github%.com/[%a%d%-%_%.]+%/?$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/?$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/tree/[%a%d%-%_%.]+%/?$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/commits/[%a%d%-%_%.]+%/?$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/releases$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/tags$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/issues$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/pulls$"] = { hl = group },
    ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/wiki$"] = { hl = group },
  }
end

return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "quarto", "rmd" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local markview = require "markview"
    local presets = require "markview.presets"

    markview.setup {
      preview = {},
      markdown = {
        -- reference_definitions = generic_hl "MarkviewPalette4Fg",
        headings = {
          enable = true,
          shift_width = 0,
          heading_1 = {
            style = "icon",
            sign = "󰌕 ",
            sign_hl = "MarkviewHeading1Sign",
            icon_hl = "MarkviewHeading1Sign",
            hl = "MarkviewHeading1",
          },

          heading_2 = {
            style = "icon",
            sign = "󰌖 ",
            sign_hl = "MarkviewHeading2Sign",
            icon_hl = "MarkviewHeading2Sign",
            hl = "MarkviewHeading2",
          },
          heading_3 = {
            style = "icon",
            icon_hl = "MarkviewHeading3Sign",
            hl = "MarkviewHeading3",
          },
          heading_4 = {
            style = "icon",
            icon_hl = "MarkviewHeading4Sign",
            hl = "MarkviewHeading4",
          },
          heading_5 = {
            style = "icon",
            icon_hl = "MarkviewHeading5Sign",
            hl = "MarkviewHeading5",
          },
          heading_6 = {
            style = "icon",
            icon_hl = "MarkviewHeading6Sign",
            hl = "MarkviewHeading6",
          },
        },
        list_items = {
          marker_minus = { add_padding = true, text = "", hl = "MarkviewListItemMinus" },
          marker_plus = { add_padding = true, text = "", hl = "MarkviewListItemPlus" },
          marker_star = { add_padding = true, text = "", hl = "MarkviewListItemStar" },
        },
        horizontal_rules = presets.horizontal_rules.thin,
        tables = presets.tables.rounded,
        code_blocks = {
          enable = true,
          style = "block",
          label_direction = "right",
        },
      },
      markdown_inline = {
        -- hyperlinks = generic_hl "MarkviewHyperlink",
        -- uri_autolinks = generic_hl "MarkviewEmail",
      },
      typst = {
        url_links = generic_hl "MarkviewEmail",
      },
      experimental = {
        check_rtp = false,
      },
    }



    vim.schedule(function()
      local ok, bqf_handler = pcall(require, "bqf.preview.handler")
      if not ok then
        return
      end
      local bqf_pvs = require "bqf.preview.session"

      local original_open = bqf_handler.open
      bqf_handler.open = function(qwinid, qidx, force)
        original_open(qwinid, qidx, force)
        vim.defer_fn(function()
          qwinid = qwinid or vim.api.nvim_get_current_win()
          local ps = bqf_pvs:get(qwinid)
          if not ps or not ps.bufnr then
            return
          end
          local ext = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ps.bufnr), ":e")
          if ext == "md" or ext == "markdown" then
            local fbufnr = ps:floatBufnr()
            if fbufnr and vim.api.nvim_buf_is_valid(fbufnr) then
              vim.bo[fbufnr].ft = "markdown"
              pcall(vim.treesitter.get_parser, fbufnr, "markdown")
              pcall(markview.strict_render.render, markview.strict_render, fbufnr)
            end
          end
        end, 100)
      end
    end)
  end,
}
