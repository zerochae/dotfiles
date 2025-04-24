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

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.supports_method "textDocument/formatting" then
      vim.api.nvim_buf_create_user_command(bufnr, "LspFormat", function()
        lsp_formatting(bufnr)
      end, { desc = "Format using LSP" })
    end
  end,
})

-- neovide
if vim.g.neovide then
  vim.opt.linespace = 12
  vim.o.guifont = "SpaceMono Nerd Font Mono:h16"
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
    vim.cmd 'normal! "+p' -- 붙여넣기
    local key = vim.api.nvim_replace_termcodes("o<Esc>", true, false, true)
    vim.api.nvim_feedkeys(key, "n", false) -- 줄 추가
  end, { desc = "Paste and go to next line" })

  -- ⌘V Insert mode: 붙여넣고 줄바꿈 (ENTER)
  vim.keymap.set("i", "<D-v>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-r>+<CR>", true, false, true), "i", false)
  end, { desc = "Paste and newline in insert mode" })

  -- ⌘V Cmdline mode는 줄바꿈 필요 없음
  vim.keymap.set("c", "<D-v>", "<C-r>+", { desc = "Paste in cmdline" })
  vim.keymap.set({ "n", "x" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
end
