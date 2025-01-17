local present, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")

if not present then
  return
end

nvim_ts_autotag.setup {
  filetypes = {
    "html",
    "javascriptreact",
    "javascript",
    "typescript",
    "typescriptreact",
    "tsx",
    "jsx",
    "vue",
  },
}
