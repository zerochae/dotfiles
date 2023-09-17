local present, dap_virtual_text = pcall(require, "nvim-dap-vitural-text")

if not present then
  return
end

dap_virtual_text.setup()
