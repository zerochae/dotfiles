local M = {}
local modules = require "ui.statusline.modules"
local config = require("grayrc").statusline

function M.generate()
  local result = {}
  for _, v in ipairs(config.order) do
    local module = modules[v]
    if type(module) == "function" then
      local out = module()
      if out then
        table.insert(result, out)
      end
    elseif module then
      table.insert(result, module)
    else
      table.insert(result, v)
    end
  end
  return table.concat(result)
end

M.state = {
  active = false,
  title = "",
  message = "",
  percentage = nil,
}

local timer = nil

local function start_spinner()
  if timer then
    return
  end
  timer = vim.uv.new_timer()
  timer:start(
    0,
    80,
    vim.schedule_wrap(function()
      if not M.state.active then
        if timer then
          timer:stop()
          timer:close()
          timer = nil
        end
        vim.cmd.redrawstatus()
        return
      end
      vim.cmd.redrawstatus()
    end)
  )
end

local function stop_spinner()
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
  vim.cmd.redrawstatus()
end

function M.setup()
  vim.o.statusline = "%!v:lua.require('ui.statusline').generate()"

  vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(args)
      if not args.data or not args.data.params then
        return
      end
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "jdtls" then
        return
      end
      local data = args.data.params.value
      if data.kind == "end" then
        M.state.active = false
        M.state.title = ""
        M.state.message = ""
        M.state.percentage = nil
        stop_spinner()
      else
        M.state.active = true
        M.state.title = data.title or ""
        M.state.message = data.message or ""
        M.state.percentage = data.percentage
        start_spinner()
      end
    end,
  })
end

return M
