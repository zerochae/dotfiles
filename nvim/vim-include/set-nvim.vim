" neovim set
set nocompatible
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set ai
set si
set clipboard=unnamedplus
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾  
set nowrap

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

let g:tokyonight_italic_functions = 1
let g:tokyonight_transparent = 1
let g:tokyonight_transparent_sidebar = 1
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_style="storm"
" Load the colorscheme
colorscheme tokyonight

" buffer
nnoremap <silent> <leader><tab> :bp<bar>sp<bar>bn<bar>bd<CR>
" nnoremap <silent>   <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
" nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
