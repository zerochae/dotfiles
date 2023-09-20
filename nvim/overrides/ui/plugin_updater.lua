local nvim_config = vim.fn.stdpath "config"
local chadrc_config = require("core.utils").load_config()
local config_branch = chadrc_config.options.nvchad_branch
local notification = { nv_chad = nil, mason = nil }
local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
local content = { " ", " ", "" }
local header = " 󰓂 Update status "
local new_cmd = vim.api.nvim_create_user_command

return function(notify)
  local function handleNotification(status, icon)
    if status == "create" then
      notification.nv_chad = notify("NvUpdater init", "info", { title = header, icon = icon })
    elseif status == "update" then
      notification.nv_chad =
        notify("NvUpdater On Progressing...", "info", { title = header, icon = icon, replace = notification.nv_chad })
    elseif status == "success" then
      notification.nv_chad =
        notify("NvUpdater complete", "info", { title = header, icon = icon, replace = notification.nv_chad })
    elseif status == "fail" then
      notification.nv_chad =
        notify("NvUpdater Fail", "warn", { title = header, icon = icon, replace = notification.nv_chad })
    end
  end

  local function nv_updater()
    local git_outputs = {}
    local index = 0
    local timer = vim.loop.new_timer()

    handleNotification("create", spinners[0])
    timer:start(0, 100, function()
      if #git_outputs ~= 0 then
        timer:stop()
      end
      vim.schedule(function()
        if #git_outputs == 0 then
          handleNotification("update", spinners[index % #spinners + 1])
        end
      end)

      index = index + 1
    end)

    local git_fetch_err = false

    local function get_commits_data()
      vim.schedule(function()
        if not git_fetch_err then
          local head_hash = vim.fn.systemlist("git -C " .. nvim_config .. " rev-parse HEAD")
          git_outputs = vim.fn.systemlist(
            "git -C " .. nvim_config .. ' log --format="format:%h: %s" ' .. head_hash[1] .. "..origin/" .. config_branch
          )

          if #git_outputs == 0 then
            git_outputs = { "Already updated!" }
          end
        end

        for i, value in ipairs(git_outputs) do
          git_outputs[i] = "  " .. value:gsub(":", "")
        end

        if not git_fetch_err then
          handleNotification("success", "")
        else
          handleNotification("fail", "󰚌")
        end
        for i = 1, #git_outputs, 1 do
          content[#content + 1] = git_outputs[i]
        end

        vim.fn.jobstart({ "git", "pull" }, { silent = true, cwd = nvim_config })
        require("lazy").sync()
        require("lazy").load { plugins = { "mason.nvim" } }
        vim.cmd "NvMasonUpdate"
      end)
    end

    vim.fn.jobstart({ "git", "fetch" }, {
      cwd = nvim_config,
      on_exit = function(_, code, _)
        get_commits_data()

        if code ~= 0 then
          git_fetch_err = true
          git_outputs[#git_outputs + 1] = "Failed to update "
          print(" error " .. code)
        end
      end,
    })
  end

  local function mason_updater()
    local registry = require "mason-registry"
    local platform = require "mason-core.platform"
    local functional = require "mason-core.functional"
    local timer = vim.loop.new_timer()
    local index = 0
    local complete = false
    local title = " 󰓂 Mason"
    notification.mason = notify("Mason Updating...", "info", { title = title, icon = spinners[0] })

    local function handle_result(success, updated_registries)
      complete = true
      if success then
        local count = #updated_registries
        notification.mason = notify(
          ("updated %d %s."):format(count, count == 1 and "registry" or "registries"),
          "info",
          { title = title, replace = notification.mason, icon = "" }
        )
      else
        notification.mason = notify(
          ("Failed to update: %s"):format(updated_registries),
          vim.log.levels.ERROR,
          "warn",
          { title = title, replace = notification.mason, icon = "󰚌" }
        )
      end
    end

    timer:start(0, 100, function()
      if notification.mason ~= nil then
        if complete then
          timer:stop()
        else
          vim.schedule(function()
            notification.mason = notify(
              "Mason Updating...",
              "info",
              { title = title, icon = spinners[index % #spinners + 1], replace = notification.mason }
            )
          end)
          index = index + 1
        end
      end
    end)

    if platform.is_headless then
      local async = require "mason-core.async"
      async.run_blocking(function()
        local success, updated_registries = async.wait(registry.update)

        async.scheduler()
        handle_result(success, updated_registries)
      end)
    else
      registry.update(functional.scheduler_wrap(handle_result))
    end
  end

  new_cmd("NvChadUpdate", function()
    nv_updater()
  end, {})

  new_cmd("NvMasonUpdate", function()
    mason_updater()
  end, {})
end
