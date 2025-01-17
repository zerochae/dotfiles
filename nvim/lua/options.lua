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

-- lsp
local lsp = vim.lsp

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 80
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- navic
vim.g.navic_silence = true
vim.b.navic_lazy_update_context = true

-- auto_cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local call_function = vim.api.nvim_call_function
local win_get_buf = vim.api.nvim_win_get_buf
local buf_get_option = vim.api.nvim_buf_get_option

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.wo.statusline = "%!v:lua.require('nvchad.stl.default')()"
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

autocmd({ "VimResized" }, {
  group = augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local api_present, tree_api = pcall(require, "nvim-tree.api")
    local view_present, tree_view = pcall(require, "nvim-tree.view")

    if not api_present then
      return
    end

    if not view_present then
      return
    end

    local is_visible = tree_view.is_visible()

    if not is_visible then
      return
    end

    tree_view.close()
    tree_api.tree.toggle { focus = false }
  end,
})

autocmd("BufEnter", {
  group = augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = call_function("winlayout", {})
    if
      layout[1] == "leaf"
      and buf_get_option(win_get_buf(layout[2]), "filetype") == "NvimTree"
      and layout[3] == nil
    then
      vim.cmd "confirm quit"
    end
  end,
})

autocmd({ "FileType" }, {
  pattern = "xhtml",
  command = "set filetype=html",
})

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("FileType", {
  pattern = "mysql",
  command = "set filetype=sql",
})

autocmd("FileType", {
  pattern = "sql",
  command = "set encoding=utf-8",
})

autocmd("FileType", {
  pattern = "sql",
  command = "set fileencodings=utf-8,cp949",
})

autocmd("FileType", {
  pattern = "sql",
  command = "setlocal omnifunc=vim_dadbod_completion#omni",
})

autocmd("FileType", {
  pattern = "sql",
  command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })",
})

autocmd("FileType", {
  pattern = "rust",
  command = "lua require('rust-tools').inlay_hints.set()",
})

autocmd("fileType", {
  pattern = { "*.env", "*.env.*", "md" },
  command = "lua vim.diagnostic.disable(0)",
})

-- new_cmd
local new_cmd = vim.api.nvim_create_user_command

new_cmd("Q", ":q", {})
new_cmd("W", ":w", {})
new_cmd("Wq", ":wq", {})
