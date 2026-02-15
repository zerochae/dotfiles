vim.g.mapleader = " "
vim.o.termguicolors = true

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  defaults = { lazy = true },
  install = { colorscheme = { "habamax" } },

  ui = {
    backdrop = 100,
    border = "single",
    icons = {
      ft = "",
      lazy = "󰒲 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})

-- load theme & ui modules
require("theme").setup()
local grayrc = require("grayrc")
if grayrc.statusline.enabled then require("ui.statusline").setup() end
if grayrc.bufline.enabled then require("ui.bufline").setup() end

require "options"
require "autocmds"

do
  local buf_name = vim.api.nvim_buf_get_name(0)
  if not vim.bo[0].modified and (buf_name == "" or vim.fn.isdirectory(buf_name) == 1) then
    local empty_buf = vim.api.nvim_get_current_buf()
    require("ui.dashboard").open()
    if vim.api.nvim_buf_is_valid(empty_buf) and empty_buf ~= vim.g.gndashboard_buf then
      vim.api.nvim_buf_delete(empty_buf, { force = true })
    end
  end
end

vim.api.nvim_create_user_command("GnDashboard", function()
  if vim.g.gndashboard_displayed then
    vim.api.nvim_buf_delete(vim.g.gndashboard_buf, { force = true })
  else
    require("ui.dashboard").open()
  end
end, {})

vim.schedule(function()
  require "mappings"
end)
