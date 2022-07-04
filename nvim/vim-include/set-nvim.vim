" neovim set
set nocompatible
set nu
set tabstop=2
set shiftwidth=2
set expandtab

" bracket auto closing
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" remember cursor position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Load the colorscheme
colorscheme tokyonight

" buffer
nnoremap <C-Tab> :new<Enter>
nnoremap <C-F5> :bprevious!<Enter>    
nnoremap <C-F4> :bp <BAR> bd #<Enter> 
