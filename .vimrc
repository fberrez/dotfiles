" Automatic install junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number			" Show line numbers
set backspace=indent,eol,start	" Makes backspace key more powerful
set showcmd			" Show me what I'm typing
set nobackup			" Don't create annoying backup file
set tabstop=4			" Tab characters with 4-spaces-wide
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " For indents that consist of 4 space characters but are entered with the tab key

" Plugins directory
call plug#begin('$HOME/.vim/plugged')

" Plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
call plug#end()

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1 " Enables syntax highlighting for JSDocs

