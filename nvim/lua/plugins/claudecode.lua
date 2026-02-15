return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = { "ClaudeCodeFocus", "ClaudeCodeSend" },
  config = true,
  opts = {
    terminal_cmd = "claude",
    terminal = {
      snacks_win_opts = {
        backdrop = false,
        position = "float",
        width = 0.9,
        height = 0.9,
        keys = {
          claude_hide = {
            "<C-t>",
            function(self)
              self:hide()
            end,
            mode = "t",
            desc = "Hide",
          },
        },
      },
    },
    diff_opts = {
      show_diff_stats = false,
    },
  },
}
