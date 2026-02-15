local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = augroup("FilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "FilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})
        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_user_command("TSInstallAll", function()
  local spec = require("lazy.core.config").plugins["nvim-treesitter"]
  local opts = type(spec.opts) == "table" and spec.opts or {}
  require("nvim-treesitter").install(opts.ensure_installed)
end, {})

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.wo.statusline = "%!v:lua.require('ui.statusline').generate()"
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

autocmd("FileType", {
  pattern = "xhtml",
  callback = function()
    vim.cmd "set filetype=html"
  end,
})

autocmd("QuitPre", {
  callback = function()
    local normal_wins = 0
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if not vim.w[win].snacks_layout then
        normal_wins = normal_wins + 1
      end
    end
    if normal_wins <= 1 then
      vim.cmd "qa!"
    end
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
    vim.cmd "set fileencodings=utf-8,cp949"
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

autocmd({ "InsertLeave", "CmdlineLeave" }, {
  group = augroup("ImSelectSwitch", { clear = true }),
  callback = function()
    vim.fn.jobstart({ "im-select", "com.apple.keylayout.ABC" }, { detach = true })
  end,
})

local new_cmd = vim.api.nvim_create_user_command

new_cmd("Q", ":q", {})
new_cmd("W", ":w", {})
new_cmd("Wq", ":wq", {})
new_cmd("Wa", ":wa", {})
new_cmd("Format", function(opts)
  local range
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
