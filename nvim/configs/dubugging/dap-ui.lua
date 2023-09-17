local present, dap_ui = pcall(require, "dapui")

if not present then
  return
end

dap_ui.setup()
