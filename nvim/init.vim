call plug#begin()

" theme
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'tribela/vim-transparent'

" autocomplate
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" code highlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" airline
Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

" tree
Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'

" search / edit
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" neovim set
set number
set tabstop=4
set shiftwidth=4
set expandtab

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

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
