local map = vim.keymap.set

-- Insert mode navigation
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- LSP diagnostic
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Quickfix
map("n", "<leader>ql", "<CMD>copen<CR>", { desc = "open quickfix list" })

-- Persistence
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "load persistence" })

-- Noice
map("n", "<leader>dn", "<CMD>NoiceDismiss<CR>", { desc = "close all notify", nowait = true })

-- Lazygit (Snacks)
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "open lazygit", nowait = true })

-- Diffview
map("n", "<C-s>", function()
  require("diffview.actions").toggle_files()
end, { desc = "toggle diff files", nowait = true })
map("n", "<leader>do", "<ESC><CMD>DiffviewOpen<CR>", { desc = "diff view open", nowait = true })
map("n", "<leader>dc", "<ESC><CMD>DiffviewClose<CR>", { desc = "diff view close", nowait = true })
map("n", "<CR>", function()
  require("diffview.actions").select_entry()
end, { desc = "select diff entry", nowait = true })

-- Gitsigns
map(
  "n",
  "<leader>cb",
  "<ESC><CMD>Gitsigns toggle_current_line_blame<CR>",
  { desc = "toggle git blame line (virtual text)", nowait = true, noremap = true }
)
map(
  "n",
  "<leader>bl",
  "<ESC><CMD>Gitsigns blame_line<CR>",
  { desc = "git blame line (popup)", nowait = true, noremap = true }
)

-- DB UI
map("n", "<leader>db", "<ESC><CMD>bd|DBUI<CR>", { desc = "open database", nowait = true })
map("n", "<leader>qe", "<Plug>(DBUI_ExecuteQuery)", { desc = "execute Query", nowait = true })

-- Snacks Picker
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>fo", function()
  Snacks.picker.recent()
end, { desc = "Find recent files" })
map("n", "<leader>fa", function()
  Snacks.picker.files { hidden = true, ignored = true }
end, { desc = "Find all files" })
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Live grep" })
map("n", "<leader>fs", function()
  Snacks.picker.grep { hidden = true, ignored = true }
end, { desc = "Live grep all" })
map("n", "<leader>fz", function()
  Snacks.picker.lines()
end, { desc = "Find in current buffer" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })
map("n", "<leader>fq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix list" })
map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git status" })
map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git branches" })
map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git log" })
map("n", "<leader>ws", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

-- Endpoint (uses snacks picker)
map("n", "<leader>ep", "<cmd>Endpoint<cr>", { desc = "Endpoint Search" })

-- Branch
map("n", "<leader>br", function()
  vim.cmd "Branch"
end, { desc = "Git branch" })

-- Quickfix item remove
map("n", "<leader>fr", function()
  local idx = vim.fn.line "."
  local qf = vim.fn.getqflist()
  table.remove(qf, idx)
  vim.fn.setqflist({}, "r", { items = qf })
end, { desc = "remove quickfix item on current cursor" })

-- Search & Replace
map(
  "v",
  "<C-r>",
  "<CMD>SearchReplaceSingleBufferVisualSelection<CR>",
  { desc = "Search Replace Visual", nowait = true }
)

-- fold text
map("n", "<leader>fd", "za", { desc = "fold toggle", nowait = true })

-- Terminal (snacks.terminal)
map({ "n", "t" }, "<A-i>", function()
  Snacks.terminal.toggle(nil, { win = { position = "float" } })
end, { desc = "Toggle float terminal" })
map({ "n", "t" }, "<A-h>", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", height = 0.3 } })
end, { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<A-v>", function()
  Snacks.terminal.toggle(nil, { win = { position = "right", width = 0.2 } })
end, { desc = "Toggle vertical terminal" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

-- Bufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<tab>", function()
  require("ui.bufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
  require("ui.bufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<leader>x", function()
  require("ui.bufline").close_buffer()
end, { desc = "buffer close" })

-- Explorer (snacks.explorer)
map("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Toggle explorer" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Focus explorer" })

-- Disabled mappings
map("n", "q:", "", { desc = "disable q:" })
map("n", "'", "", { desc = "disable '" })
map("n", '"', "", { desc = 'disable "' })

-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action", nowait = true, noremap = true })
map("n", "<leader>gn", vim.diagnostic.goto_next, { desc = "LSP diagnostic next", nowait = true })
map("n", "<leader>gp", vim.diagnostic.goto_prev, { desc = "LSP diagnostic prev", nowait = true })
map("n", "<leader>rr", vim.lsp.buf.rename, { desc = "LSP rename", nowait = true })
map("n", "F", function()
  Snacks.picker.lsp_references()
end, { desc = "LSP references", nowait = true })
map("n", "K", function()
  vim.lsp.buf.hover {
    border = "rounded",
    max_width = 80,
    max_height = 20,
    title = " Hover ",
    title_pos = "center",
  }
end, { desc = "hover doc", nowait = true })
map("n", "<leader>lo", function()
  Snacks.picker.lsp_symbols()
end, { desc = "LSP symbols", nowait = true })
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "LSP goto definition", nowait = true, noremap = true })

-- kulala
map({ "n", "v" }, "<leader>rs", function()
  require("kulala").run()
end, { desc = "kulala send request", noremap = true, nowait = true })

-- General mappings
map("n", ":", "<ESC>:", { desc = "command", noremap = true, nowait = true })
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights", noremap = true, nowait = true })
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "<leader><tab>", "<ESC><CMD>tabn<CR>", { desc = "move next tab", nowait = true })
map("n", "<leader>fm", function()
  require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "LSP formatting" })
-- map("v", "<leader>fm", "<CMD>Format<CR>", { desc = "LSP formatting" })
map("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "tab close" })
map("n", "<leader>tt", "<CMD>tabnew<CR>", { desc = "tab new" })
map("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "tab new", noremap = true })
map("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "tab new", noremap = true })
map("n", "W", "w", { desc = "save", noremap = true })
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints", noremap = true })

-- Claude Code
-- map({ "n" }, "<leader>a", nil, { desc = "AI/Claude Code" })
map({ "n" }, "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map({ "n" }, "<C-t>", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map({ "n" }, "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map({ "n" }, "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map({ "n" }, "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map({ "n" }, "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
local function ensure_claude_running()
  local ok, cc = pcall(require, "claudecode")
  if not ok then
    return false
  end
  if not cc.is_claude_connected() then
    vim.cmd "ClaudeCodeOpen"
  end
  return true
end

local function claude_add_from_explorer(range)
  local pickers = Snacks.picker.get { source = "explorer" }
  if #pickers == 0 then
    return false
  end
  local picker = pickers[1]
  local files = {}
  if range then
    for idx = range[1], range[2] do
      local item = picker.list:get(idx)
      if item and item.file and item.file ~= "" and not item.dir then
        files[#files + 1] = item.file
      end
    end
  else
    local item = picker:current()
    if item and item.file and item.file ~= "" then
      files[#files + 1] = item.file
    end
  end
  if #files == 0 then
    return false
  end
  ensure_claude_running()
  for _, f in ipairs(files) do
    vim.cmd("ClaudeCodeAdd " .. vim.fn.fnameescape(f))
  end
  return true
end

map({ "n" }, "<leader>as", function()
  if not claude_add_from_explorer() then
    vim.cmd "ClaudeCodeTreeAdd"
  end
end, { desc = "Add file" })

map({ "v" }, "<leader>as", function()
  local s = vim.fn.line "v"
  local e = vim.fn.line "."
  if s > e then
    s, e = e, s
  end
  if not claude_add_from_explorer { s, e } then
    vim.cmd "ClaudeCodeSend"
  end
end, { desc = "Send to Claude" })
