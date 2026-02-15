return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  opts = {
    ui = {
      backdrop = 100,
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
  },
}
