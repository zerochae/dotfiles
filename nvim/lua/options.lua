require "nvchad.options"

-- api
local api = vim.api

api.nvim_set_option("iminsert", 0)
api.nvim_set_option("imsearch", -1)

-- opt
local opt = vim.opt

opt.shell = "/bin/zsh"
opt.number = true
opt.termguicolors = true
opt.fillchars:append {
  diff = "╱",
  fold = " ",
  foldopen = "",
  foldclose = "",
}
opt.conceallevel = 0
-- opt.swapfile = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
-- g
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/configs/edting/lua_snip"

-- filetype
local filetype = vim.filetype

filetype.add {
  extension = {
    mdx = "mdx",
    log = "log",
    conf = "conf",
    env = "dotenv",
    rasi = "rasi",
    xhtml = "html",
    http = "http",
    tfpl = "tfpl",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
    ["tsconfig.json"] = "jsonc",
    ["tsconfig.base.json"] = "jsonc",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "dotenv",
    ["rc$"] = "dot",
  },
}

-- navic
vim.g.navic_silence = true
vim.b.navic_lazy_update_context = true

-- neovide
if vim.g.neovide then
  vim.opt.linespace = 12
  vim.o.guifont = "SpaceMono Nerd Font Mono:h16:700"
  vim.g.neovide_opacity = 0.99
  vim.g.neovide_normal_opacity = 0.05
  vim.g.neovide_window_blurred = true
  vim.g.neovide_cursor_short_animation_length = 0.04
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 4
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 4
  vim.keymap.set("n", "<D-v>", function()
    vim.cmd 'normal! "+p'
    local key = vim.api.nvim_replace_termcodes("o<Esc>", true, false, true)
    vim.api.nvim_feedkeys(key, "n", false) -- 줄 추가
  end, { desc = "Paste and go to next line" })

  vim.keymap.set("i", "<D-v>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-r>+<CR>", true, false, true), "i", false)
  end, { desc = "Paste and newline in insert mode" })

  vim.keymap.set("c", "<D-v>", "<C-r>+", { desc = "Paste in cmdline" })
  vim.keymap.set({ "n", "x" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
end
