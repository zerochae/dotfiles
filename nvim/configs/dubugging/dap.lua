local present, dap = pcall(require, "dap")

if not present then
  return
end

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local dapui = require "dapui"

dap.set_log_level = "ERROR"

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { mason_path .. "packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

dap.configurations.typescript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

dap.configurations.javascriptreact = {
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

dap.configurations.typescriptreact = {
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
