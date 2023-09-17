local autocmd = vim.api.nvim_create_autocmd

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("VimResized", {
  pattern = "*",
  command = "lua require('nvim-tree')",
})

autocmd("BufEnter", {
  pattern = "*",
  command = "setlocal nonumber",
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
  pattern = "sql",
  command = "lua require('custom.utils.helper').Add_Utf8_Header()",
})

autocmd("FileType", {
  pattern = "rust",
  command = "lua require('rust-tools').inlay_hints.set()",
})

autocmd("BufEnter", {
  pattern = "dotenv",
  command = "lua vim.diagnostic.disable(0)",
})

-- cava sh exit
autocmd("VimLeavePre", {
  pattern = "*",
  command = "call system('pkill -f /tmp/polybar_cava_config && pkill -f cava.sh')",
})

autocmd("BufEnter", {
  pattern = "*",
  command = [[
  hi DiagnosticUnderlineError gui=undercurl
  hi DiagnosticUnderlineWarn gui=undercurl
  hi DiagnosticUnderlineInfo gui=undercurl
  hi DiagnosticUnderlineHint gui=undercurl guisp=orange
  hi DiagnosticUnderlineOk gui=undercurl
  ]],
})

-- autocmd("BufEnter", {
--   pattern = "*",
--   command = [[
--   syntax match Neofetch1 /'c./
--   syntax match Neofetch1 /,xNMM./
--   syntax match Neofetch1 /.OMMMMo/
--   syntax match Neofetch1 /OMMM0,/
--   syntax match Neofetch1 /.;loddo:' loolloddol;./
--   syntax match Neofetch1 /cKMMMMMMMMMMNWMMMMMMMMMM0:/
--   syntax match Neofetch2 /.KMMMMMMMMMMMMMMMMMMMMMMMWd./
--   syntax match Neofetch2 /XMMMMMMMMMMMMMMMMMMMMMMMX./
--   syntax match Neofetch3 /;MMMMMMMMMMMMMMMMMMMMMMMM:/
--   syntax match Neofetch3 /:MMMMMMMMMMMMMMMMMMMMMMMM:/
--   syntax match Neofetch3 /.MMMMMMMMMMMMMMMMMMMMMMMMX./
--   syntax match Neofetch3 /kMMMMMMMMMMMMMMMMMMMMMMMMWd./
--   syntax match Neofetch4 /.XMMMMMMMMMMMMMMMMMMMMMMMMMMk/
--   syntax match Neofetch4 /.XMMMMMMMMMMMMMMMMMMMMMMMMK./
--   syntax match Neofetch5 /kMMMMMMMMMMMMMMMMMMMMMMd/
--   syntax match Neofetch5 /;KMMMMMMMWXXWMMMMMMMk./
--   syntax match Neofetch5 /.cooc,.    .,coo:./
--   ]],
-- })
