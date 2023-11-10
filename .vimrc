set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize Vundle
" The directory should be changed in case you downloaded in case you download it somewhere else
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 
" All the plugins to be installed are to be mentioned here
" inside the vundle#begin and vundle#end

Bundle 'matze/vim-move'

call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin()

Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'LunarWatcher/auto-pairs'
Plug 'maxboisvert/vim-simple-complete'

call plug#end()

" NERDTree commands
nnoremap <C-n> :NERDTree<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

syntax enable
set background=dark
colorscheme solarized
