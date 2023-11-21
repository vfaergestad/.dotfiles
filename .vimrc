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
Bundle 'takac/vim-hardtime'

call vundle#end()            " required

syntax enable
set background=dark
colorscheme solarized
