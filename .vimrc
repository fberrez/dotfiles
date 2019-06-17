" automatic install junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins directory
call plug#begin('$HOME/.vim/plugged')

" plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-airline/vim-airline'

call plug#end()

set encoding=utf-8

" indent settings
filetype indent on
" show existing tab with 4 spaces width
set tabstop=4
" when identing with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" copy the indentation from the previous line and
" automatically inserts one extra level of indentation
set smartindent 

" show line numbers
set number			
" makes backspace key more powerful
set backspace=indent,eol,start	
" show me what I'm typing
set showcmd			
" no backup and swap files
set nobackup	
set noswapfile

" search settings
" seach case insensitive...
set ignorecase
" ... but not when search pattern contains upper case characters
set smartcase
" highlight search results
set hlsearch

" Smart move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Clears word highlighting in the current document
" but leaves the search term in the search register
nnoremap <C-x> :noh<CR>

" Senter after going to the end of the file
noremap G Gzz
