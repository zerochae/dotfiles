return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "BufReadPost",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_leader = "<leader>D"
    vim.g.VM_maps = {
      ["Find Under"] = "D",
      ["Find Subword Under"] = "D",
    }
    vim.g.VM_silent_exit = 1
    vim.g.VM_set_statusline = 0
  end,
}
