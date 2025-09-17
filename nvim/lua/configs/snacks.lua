---@type snacks.Config
---

return {
  image = {},
  layout = {},
  picker = {
    layout = {},
  },
  lazygit = {},
  -- notifier = {
  --   timeout = 3000, -- default timeout in ms
  --   width = { min = 40, max = 0.4 },
  --   height = { min = 1, max = 0.6 },
  --   margin = { top = 0, right = 1, bottom = 0 },
  --   padding = true, -- add 1 cell of left/right padding to the notification window
  --   sort = { "level", "added" }, -- sort by level and time
  --   level = vim.log.levels.TRACE,
  --   icons = {
  --     error = " ",
  --     warn = " ",
  --     info = " ",
  --     debug = " ",
  --     trace = " ",
  --   },
  --   keep = function(notif)
  --     return vim.fn.getcmdpos() > 0
  --   end,
  --   ---@type snacks.notifier.style
  --   style = "compact",
  --   top_down = true, -- place notifications from top to bottom
  --   date_format = "%R", -- time format for notifications
  --   ---@type string|boolean
  --   more_format = " ↓ %d lines ",
  --   refresh = 50, -- refresh at most every 50ms
  -- },
  bigfile = {
    notify = true,
    size = 1.5 * 1024 * 1024, -- 1.5MB
    line_length = 1000,
    ---@param ctx {buf: number, ft:string}
    setup = function(ctx)
      if vim.fn.exists ":NoMatchParen" ~= 0 then
        vim.cmd [[NoMatchParen]]
      end
      Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
      vim.b.minianimate_disable = true
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ctx.buf) then
          vim.bo[ctx.buf].syntax = ctx.ft
        end
      end)
    end,
  },
}
