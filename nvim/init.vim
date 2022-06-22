call plug#begin()

" 자동완성
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 테마
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
" 코드 하이라이터
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" 에어라인 아이콘
Plug 'kyazdani42/nvim-web-devicons'
" 에어라인
Plug 'nvim-lualine/lualine.nvim'
" tree
Plug 'preservim/nerdtree'
" tree icon
Plug 'ryanoasis/vim-devicons'
" vim-transparent -> 컬러 스키마와 투명배경을 같이 쓰기
Plug 'tribela/vim-transparent'
" easymotion
Plug 'easymotion/vim-easymotion'

call plug#end()

" neovim set
set number

" Load the colorscheme
colorscheme tokyonight

" buffer
nnoremap <C-S-t> :new<Enter>
nnoremap <C-F5> :bprevious!<Enter>    
nnoremap <C-F6> :bnext!<Enter>        
nnoremap <C-F4> :bp <BAR> bd #<Enter> 

" include set file
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor
