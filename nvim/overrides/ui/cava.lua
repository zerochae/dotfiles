return function(notify)
  local cava_notity = nil
  local function stop_cava(stdin, stdout, handle)
    stdin:read_stop()
    stdin:close()
    stdout:read_stop()
    stdout:close()
    handle:close()
  end

  local function handle_cava_notify(cava_string)
    if cava_notity then
      cava_notity = notify(cava_string, "info", { title = "Music streming", icon = " ", replace = cava_notity })
    else
      cava_notity = notify(cava_string, "info", { title = "Music streming", icon = " " })
    end
  end

  local function read_cava_string(uv, stdout)
    uv.read_start(
      stdout,
      vim.schedule_wrap(function(err, data)
        if not err and data then
          handle_cava_notify(data)
        end
      end)
    )
  end

  local function run_cava()
    local uv = vim.loop
    local stdin = uv.new_pipe(false)
    local stdout = uv.new_pipe(false)
    local stderr = uv.new_pipe(false)
    local cava_path = vim.fn.expand "$HOME/.config/nvim/lua/custom/configs/cava/cava.sh"
    local handle = uv.spawn(cava_path, { stdio = { stdin, stdout, stderr } })
    read_cava_string(uv, stdout)
  end

  run_cava()
end
