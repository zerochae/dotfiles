local present, tid = pcall(require, "tiny-inline-diagnostic")

if not present then
  return
end

tid.setup {
  preset = "simple",
  signs = {
    diag = "",
  },
  blend = {
    factor = 0.3,
  },
  hi = {
    error = "DiagnosticError",
    warn = "DiagnosticWarn",
    info = "DiagnosticInfo",
    hint = "DiagnosticHint",
  },
  options = {
    show_source = {
      enabled = true,
      if_many = true,
    },
    use_icons_from_diagnostic = true,
  },
}

vim.diagnostic.config { virtual_text = false }
