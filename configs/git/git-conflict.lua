local present, git_conflict = pcall(require, "git-conflict")

if not present then
  return
end

git_conflict.setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  list_opener = "copen", -- command or function to open the conflicts list
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffAdd",
    current = "DiffText",
  },
}

vim.api.nvim_command "highlight GitConflictAncestor guibg=#2f7366"
vim.api.nvim_command "highlight GitConflictAncestorLabel guibg=#2f7366"
vim.api.nvim_command "highlight GitConflictCurrent guibg=#2e5049"
vim.api.nvim_command "highlight GitConflictCurrentLabel guibg=#2e5049"
vim.api.nvim_command "highlight GitConflictIncoming guibg=#344f69"
vim.api.nvim_command "highlight GitConflictIncomingLabel guibg=#344f69"
