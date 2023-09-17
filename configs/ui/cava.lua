local cava_output = nil
local uv = vim.loop
local stdin = uv.new_pipe(false)
local stdout = uv.new_pipe(false)
local stderr = uv.new_pipe(false)
local cava_path = vim.fn.expand "$HOME/.config/nvim/lua/custom/scripts/cava.sh"
local handle = uv.spawn(cava_path, { stdio = { stdin, stdout, stderr } }, function()
  _G.stop_cava()
end)

local function run_cava()
  if _G.stop_cava then
    _G.stop_cava()
  end

  uv.read_start(
    stdout,
    vim.schedule_wrap(function(_, data)
      if data then
        cava_output = data
      end
      return cava_output
    end)
  )
  _G.stop_cava = function()
    stdin:read_stop()
    stdin:close()
    stdout:read_stop()
    stdout:close()
    handle:close()
    _G.stop_cava = nil
  end
end

if not cava_output then
  run_cava()
end

return cava_output
