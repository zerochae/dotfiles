local present, notify = pcall(require, "notify")

if not present then
  return
end

local banned_messages = {
  "No information available",
  "No code actions available",
  "method textDocument/codeAction is not supported by any of the servers registered for the current buffer",
  "no manual entry for",
  "No matching notification found to replace",
}

vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if string.match(msg, banned) then
      return
    end
  end
  notify(msg, ...)
end

notify.setup {
  background_colour = "#000000",
}

-- local cava_notity = nil
-- local function stop_cava(stdin, stdout, handle)
--   stdin:read_stop()
--   stdin:close()
--   stdout:read_stop()
--   stdout:close()
--   handle:close()
-- end
--
-- local function handle_cava_notify(cava_string)
--   if cava_notity then
--     cava_notity = notify(cava_string, "info", { title = "Music streming", icon = " ", replace = cava_notity })
--   else
--     cava_notity = notify(cava_string, "info", { title = "Music streming", icon = " " })
--   end
-- end
--
-- local function read_cava_string(uv, stdout)
--   uv.read_start(
--     stdout,
--     vim.schedule_wrap(function(err, data)
--       if not err and data then
--         handle_cava_notify(data)
--       end
--     end)
--   )
-- end
--
-- local function run_cava()
--   local uv = vim.loop
--   local stdin = uv.new_pipe(false)
--   local stdout = uv.new_pipe(false)
--   local stderr = uv.new_pipe(false)
--   local cava_path = vim.fn.expand "$HOME/.config/nvim/lua/custom/configs/cava/cava.sh"
--   local handle = uv.spawn(cava_path, { stdio = { stdin, stdout, stderr } })
--   read_cava_string(uv, stdout)
-- end
--
-- run_cava()

local client_notifs = {}

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(name, token)
  local notif_data = client_notifs[name]

  if notif_data and notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #spinner_frames

    local new_notif =
      notify(nil, nil, { hidden = true, icon = spinner_frames[new_spinner], replace = notif_data.notification })
    client_notifs[name] = {
      notification = new_notif,
      spinner = new_spinner,
    }

    vim.defer_fn(function()
      update_spinner(name, token)
    end, 100)
  end
end

local function format_title(title, client_name)
  return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
  if message == nil or percentage == nil then
    return " Loading..."
  end

  return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- TODO: 퍼센페이지 합치기, 키값 lsp로 잡기
vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  local client_id = ctx.client_id
  local val = result.value
  local get_client_by_id = vim.lsp.get_client_by_id(client_id)
  local name = get_client_by_id.name

  if name == "null-ls" then
    return
  end

  if val.kind then
    if not client_notifs[name] then
      client_notifs[name] = {}
    end

    local notif_data = client_notifs[name]

    if val.kind == "begin" then
      local message = format_message(val.message, val.percentage)
      local notification = notify(message, "info", {
        title = format_title(val.title, name),
        icon = spinner_frames[1],
        timeout = false,
        hidden = false,
        replace = notif_data.notification,
      })

      client_notifs[name] = {
        notification = notification,
        spinner = 1,
      }

      update_spinner(name, result.token)
    elseif val.kind == "report" and notif_data then
      local new_notif = notify(
        format_message(val.message, val.percentage),
        "info",
        { replace = notif_data.notification, hidden = false }
      )

      client_notifs[name] = {
        notification = new_notif,
        spinner = notif_data.spinner,
      }
    elseif val.kind == "end" and notif_data then
      local new_notif = notify(
        val.message and format_message(val.message) or " " .. name .. " - Load Complete",
        "info",
        { icon = "", replace = notif_data.notification, timeout = 3000 }
      )

      client_notifs[name] = {
        notification = new_notif,
      }
    end
  end
end
