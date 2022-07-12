set termguicolors
lua << EOF
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
   close_command = "bdelete! %d",
   right_mouse_command = "bdelete! %d"
  }
}
EOF

nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

nnoremap <silent> <tab> :BufferLineMoveNext<CR>
nnoremap <silent><s-tab> :BufferLineMovePrev<CR>

nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent>bb :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
