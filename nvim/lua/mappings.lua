require "nvchad.mappings"
local map = vim.keymap.set

-- Quickfix
map("n", "<leader>ql", "<CMD>copen<CR>", { desc = "open quickfix list" })

-- Spectre
map("n", "<leader>sp", "<CMD>Spectre<CR>", { desc = "open spectre" })

-- Persistence
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "load persistence" })

-- Noice
map("n", "<leader>dn", "<CMD>NoiceDismiss<CR>", { desc = "close all notify", nowait = true })

-- Lazygit
map("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "open lazygit", nowait = true })

-- Diffview
map("n", "<C-s>", function()
  require("diffview.actions").toggle_files()
end, { desc = "toggle diff files", nowait = true })
map("n", "<leader>do", "<ESC><CMD>DiffviewOpen<CR>", { desc = "diff view open", nowait = true })
map("n", "<leader>dc", "<ESC><CMD>DiffviewClose<CR>", { desc = "diff view close", nowait = true })
map("n", "<CR>", function()
  require("diffview.actions").select_entry()
end, { desc = "select diff entry", nowait = true })

-- Hop
map("n", "<leader>jj", "<ESC><CMD>HopPattern<CR>", { desc = "search word use pattern in hop", nowait = true })

-- Gitsigns
map(
  "n",
  "<leader>gcb",
  "<ESC><CMD>Gitsigns toggle_current_line_blame<CR>",
  { desc = "toggle git blame line", nowait = true }
)

-- DB UI
map("n", "<leader>db", "<ESC><CMD>bd|DBUI<CR>", { desc = "open database", nowait = true })
map("n", "<leader>qe", "<Plug>(DBUI_ExecuteQuery)", { desc = "execute Query", nowait = true })

-- Telescope
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files {
    preview_title = " Preview",
    prompt_title = " Search Files",
    debounce = "300",
    file_ignore_patterns = {
      "node_modules",
      "%.png",
      "%.svg",
      "%.mp4",
      "%.jpg",
      "%.jpeg",
      "custom/assets",
      "assets/ascii",
      "static/js",
      "%.bundle.js",
      "%.mjs",
      "%.cjs",
      ".git",
      ".DS_Store",
    },
  }
end, { desc = "Find files" })

map("n", "<leader>fo", function()
  require("telescope.builtin").oldfiles {
    preview_title = " Preview",
    prompt_title = " Search Recent",
    debounce = "300",
  }
end, { desc = "Find oldfiles" })

map("n", "<leader>fa", function()
  require("telescope.builtin").find_files {
    preview_title = " Preview",
    prompt_title = " Search All Files",
    follow = true,
    no_ignore = true,
    hidden = true,
    debounce = "1000",
  }
end, { desc = "Find all" })

map("n", "<leader>fs", function()
  local conf = require("telescope.config").values
  require("telescope.builtin").live_grep {
    preview_title = " Preview",
    prompt_title = " Live Grep All Files",
    follow = true,
    no_ignore = true,
    hidden = true,
    debounce = "500",
    vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
    file_ignore_patterns = {
      "node_modules",
      "%.png",
      "%.svg",
      "%.mp4",
      "%.jpg",
      "%.jpeg",
      "custom/assets",
      "assets/ascii",
      "static/js",
      "%.bundle.js",
      "%.mjs",
      "%.cjs",
      ".git",
      ".DS_Store",
    },
  }
end, { desc = "Telescope grep string" })

map("n", "<leader>fw", function()
  local conf = require("telescope.config").values
  require("telescope.builtin").live_grep {
    preview_title = " Preview",
    prompt_title = " Live Grep",
    debounce = "500",
    vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
    file_ignore_patterns = {
      "node_modules",
      "%.png",
      "%.svg",
      "%.mp4",
      "%.jpg",
      "%.jpeg",
      "custom/assets",
      "assets/ascii",
      "static/js",
      "%.bundle.js",
      "%.mjs",
      "%.cjs",
      ".git",
      ".DS_Store",
    },
  }
end, { desc = "Live grep" })

map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags {
    preview_title = " Preview",
    prompt_title = "󰛵 Search Help",
  }
end, { desc = "Help page" })

map("n", "<leader>fz", function()
  require("telescope.builtin").current_buffer_fuzzy_find {
    preview_title = " Preview",
    prompt_title = " Search Fzf",
  }
end, { desc = "Find in current buffer" })

map("n", "<leader>ws", "<CMD>Telescope workspaces<CR>", { desc = "open projects" })

map("n", "<leader>gs", function()
  require("telescope.builtin").git_status {
    preview_title = " Preview",
    prompt_title = " Git Status",
    git_icons = {
      added = "",
      changed = "",
      copied = ">",
      deleted = "",
      renamed = "",
      unmerged = "",
      untracked = "",
    },
    previewer = require("telescope.previewers").new_termopen_previewer {
      get_command = function(entry)
        if entry.status == "??" or "A " then
          return { "git", "diff", entry.value }
        end

        return { "git", "diff", entry.value .. "^!" }
      end,
    },
  }
end, { desc = "open git status" })

map("n", "<leader>fq", function()
  require("telescope.builtin").quickfix()
end, { desc = "open quickfix" })

-- Search & Replace
map(
  "v",
  "<C-r>",
  "<CMD>SearchReplaceSingleBufferVisualSelection<CR>",
  { desc = "Search Replace Visual", nowait = true }
)

-- Disabled mappings
map("n", "q:", "", { desc = "disable q:" })
map("n", "'", "", { desc = "disable '" })
map("n", '"', "", { desc = 'disable "' })

-- Lspsaga
map("n", "<leader>ca", "<ESC><CMD>Lspsaga code_action<CR>", { desc = "LSP code action", nowait = true, noremap = true })
map("n", "<leader>gn", "<ESC><CMD>Lspsaga diagnostic_jump_next<CR>", { desc = "LSP code action", nowait = true })
map("n", "<leader>rr", "<CMD>Lspsaga rename<CR>", { desc = "LSP rename", nowait = true })
map("n", "F", "<ESC><CMD>Lspsaga finder<CR>", { desc = "LSP code Finder", nowait = true })
map("n", "K", "<ESC><CMD>Lspsaga hover_doc<CR>", { desc = "hover doc", nowait = true })
map("n", "<leader>lo", "<ESC><CMD>Lspsaga outline<CR>", { desc = "LSP outline", nowait = true })
map("n", "gd", "<ESC><CMD>Lspsaga goto_definition<CR>", { desc = "LSP goto definition", nowait = true })

-- General mappings
map("n", ":", "<ESC>:", { desc = "command", noremap = true, nowait = true })
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights", noremap = true, nowait = true })
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "<leader><tab>", "<ESC><CMD>tabn<CR>", { desc = "move next tab", nowait = true })
map("n", "<leader>fm", "<CMD>LspFormat<CR>", { desc = "LSP formatting" })
map("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "tab close" })
map("n", "<leader>tabnew", "<CMD>tabnew<CR>", { desc = "tab new" })
map("n", "W", "w", { desc = "save", noremap = true })
