local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local call_function = vim.api.nvim_call_function
local win_get_buf = vim.api.nvim_win_get_buf
local buf_get_option = vim.api.nvim_buf_get_option

autocmd({ "CursorHold", "BufEnter" }, {
  group = augroup("NavicAttach", { clear = true }),
  callback = function(args)
    require("custom.overrides.ui.navic").set_navic(args)
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

-- autocmd("BufEnter", {
--   pattern = "*",
--   command = [[
--     hi DiagnosticUnderlineError gui=undercurl guisp=#d35c65
--     hi DiagnosticUnderlineWarn gui=undercurl guisp=#d4b06b
--     hi DiagnosticUnderlineInfo gui=undercurl guisp=#88b369
--     hi DiagnosticUnderlineHint gui=undercurl guisp=#b568cd
--     hi DiagnosticUnderlineOk gui=undercurl guisp=#46a6b2
--     ]],
-- })

-- local function highlight_globalVim()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--
--   for i, line in ipairs(lines) do
--     local isComment = string.find(line, "%-%-") -- 주석인지 확인합니다.
--
--     if isComment then
--       return
--     end
--
--     local tag_search_pattern = "vim%."
--     local tag_match_start, tag_match_end = string.find(line, tag_search_pattern)
--     if tag_match_start then
--       vim.api.nvim_buf_add_highlight(bufnr, -1, "LuaGlobalVim", i - 1, tag_match_start - 1, tag_match_end - 1)
--     end
--   end
-- end
--
-- local function highlight_documentation()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--
--   for i, line in ipairs(lines) do
--     local tag_search_pattern = "(%-%-%-@%S+)([%w_]+)"
--     local tag_match_start, tag_match_end = string.find(line, tag_search_pattern)
--     if tag_match_start then
--       local tag_start_col = tag_match_start + 2
--       local tag_end_col = tag_match_end or -1
--       vim.api.nvim_buf_add_highlight(bufnr, -1, "LuaDocumentTag", i - 1, tag_start_col, tag_end_col)
--
--       if tag_match_end and tag_match_end < #line then
--         local param_search_pattern = "([%S]+)"
--         local param_match_start, param_match_end = string.find(line, param_search_pattern, tag_match_end + 1)
--         if param_match_start and param_match_end then
--           vim.api.nvim_buf_add_highlight(bufnr, -1, "LuaDocumentParam", i - 1, param_match_start - 1, param_match_end)
--         end
--       end
--     end
--   end
-- end

-- autocmd({ "FileType", "VimResized", "BufEnter" }, {
--   pattern = "lua",
--   callback = function()
--     highlight_documentation()
--     highlight_globalVim()
--   end,
-- })

autocmd("fileType", {
  pattern = { "*.env", "*.env.*", "md" },
  command = "lua vim.diagnostic.disable(0)",
})
