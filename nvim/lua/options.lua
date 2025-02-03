require "nvchad.options"

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

-- navic
vim.g.navic_silence = true
vim.b.navic_lazy_update_context = true

-- auto_cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "VimResized" }, {
  group = augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local view_present, tree_view = pcall(require, "nvim-tree.view")

    if not view_present or not (view_present and tree_view.is_visible()) then
      return
    end

    local width = require("ui.nvim-tree.utils").dynamic_nvim_tree_width()

    vim.cmd("tabdo NvimTreeResize " .. width)
  end,
})

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.wo.statusline = "%!v:lua.require('nvchad.stl.default')()"
  end,
})

autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    vim.cmd "set filetype=sh"
  end,
})

autocmd("FileType", {
  pattern = "tfpl",
  callback = function()
    vim.cmd "set filetype=yaml"
  end,
})

autocmd("FileType", {
  pattern = "objcpp",
  callback = function()
    vim.cmd "set filetype=objc"
  end,
})

autocmd({ "FileType" }, {
  pattern = "xhtml",
  callback = function()
    vim.cmd "set filetype=html"
  end,
})

autocmd("VimResized", {
  pattern = "*",
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd("FileType", {
  pattern = "mysql",
  callback = function()
    vim.cmd "set filetype=sql"
  end,
})

autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.cmd "set encoding=utf-8"
  end,
})

autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.cmd "set fileencodings=utf-8,cp949"
  end,
})

autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.cmd "setlocal omnifunc=vim_dadbod_completion#omni"
  end,
})

autocmd("FileType", {
  pattern = "sql",
  callback = function()
    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
  end,
})

autocmd("FileType", {
  pattern = "rust",
  callback = function()
    require("rust-tools").inlay_hints.set()
  end,
})

autocmd("fileType", {
  pattern = { "*.env", "*.env.*", "md" },
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

-- new_cmd
local new_cmd = vim.api.nvim_create_user_command

new_cmd("Q", ":q", {})
new_cmd("W", ":w", {})
new_cmd("Wq", ":wq", {})
