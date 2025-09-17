require "nvchad.autocmds"

-- auto_cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimResized", {
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
    vim.diagnostic.enable(false)
  end,
})

autocmd("FileType", {
  pattern = "vue",
  callback = function()
    vim.bo.commentstring = "<!-- %s -->"
  end,
})

-- new_cmd
local new_cmd = vim.api.nvim_create_user_command

new_cmd("Q", ":q", {})
new_cmd("W", ":w", {})
new_cmd("Wq", ":wq", {})
new_cmd("Wa", ":wa", {})
new_cmd("Format", function(opts)
  ---@cast opts { line1: integer, line2: integer, range: integer, count: integer|nil }

  local range
  -- 시각 모드/라인 범위 전달 여부는 count 보단 range로 판단하는 게 더 안전
  if opts.range > 0 then
    local last_line = vim.api.nvim_buf_get_lines(0, opts.line2 - 1, opts.line2, true)[1] or ""
    range = {
      start = { opts.line1, 0 },
      ["end"] = { opts.line2, #last_line },
    }
  end

  require("conform").format {
    async = true,
    lsp_fallback = true,
    range = range,
  }
end, { range = true, desc = "Format buffer or visual range" })
