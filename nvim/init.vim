call plug#begin()

" theme
Plug 'folke/tokyonight.nvim', {'branch': 'main'}

" code hightlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" airline
Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

" bufferline
Plug 'akinsho/bufferline.nvim',{'tag': 'v2.*'}

" tree
Plug 'kyazdani42/nvim-tree.lua'

" search / edit
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" include set file
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor

" mapleader
let mapleader = " "