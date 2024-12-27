-- api
local api = vim.api

api.nvim_set_option("iminsert", 0)
api.nvim_set_option("imsearch", -1)

-- opt
local opt = vim.opt

opt.number = true
opt.termguicolors = true
opt.fillchars = opt.fillchars + "diff:╱"
opt.conceallevel = 0
-- opt.swapfile = false

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

vim.treesitter.language.register("mdx", "markdown")

-- lsp
local lsp = vim.lsp

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 80
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
