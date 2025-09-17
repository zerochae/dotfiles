local status, mason = pcall(require, "mason")

if not status then
  return
end

mason.setup {
  ui = {
    border = "single",
  },
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
  },
}
