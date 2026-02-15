local o = vim.o
local opt = vim.opt
local g = vim.g

o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.numberwidth = 2
o.ruler = false

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.updatetime = 250

o.shell = "/bin/zsh"
o.termguicolors = true
o.conceallevel = 0
o.iminsert = 0
o.imsearch = -1

opt.shortmess:append "sI"
opt.whichwrap:append "<>[]hl"
opt.fillchars = { eob = " " }
opt.fillchars:append { diff = "╱", fold = " ", foldopen = "", foldclose = "" }

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldlevel = 99

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/configs/edting/lua_snip"

local sep = vim.fn.has "win32" ~= 0 and "\\" or "/"
local delim = vim.fn.has "win32" ~= 0 and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

vim.filetype.add {
  extension = {
    md = "markdown",
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

g.navic_silence = true
vim.b.navic_lazy_update_context = true

if g.neovide then
  opt.linespace = 12
  o.guifont = "SpaceMono Nerd Font Mono:h16:700"
  g.neovide_opacity = 0.99
  g.neovide_normal_opacity = 0.05
  g.neovide_window_blurred = true
  g.neovide_cursor_short_animation_length = 0.04
  g.neovide_cursor_vfx_mode = "torpedo"
  g.neovide_padding_top = 4
  g.neovide_padding_bottom = 4
  g.neovide_padding_right = 4
  g.neovide_padding_left = 4
  vim.keymap.set("n", "<D-v>", function()
    vim.cmd 'normal! "+p'
    local key = vim.api.nvim_replace_termcodes("o<Esc>", true, false, true)
    vim.api.nvim_feedkeys(key, "n", false)
  end, { desc = "Paste and go to next line" })

  vim.keymap.set("i", "<D-v>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-r>+<CR>", true, false, true), "i", false)
  end, { desc = "Paste and newline in insert mode" })

  vim.keymap.set("c", "<D-v>", "<C-r>+", { desc = "Paste in cmdline" })
  vim.keymap.set({ "n", "x" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
end
