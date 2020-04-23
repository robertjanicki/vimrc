""""""""""
""Robert""
""""""""""

"Automatic Plug installation script
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plug Plugins

call plug#begin()

""A:
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'

""C:
Plug 'rhysd/vim-clang-format'
Plug 'universal-ctags/ctags'

""N:
Plug 'scrooloose/nerdtree'

""S:
Plug 'tpope/vim-speeddating'

""T:
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar' "Dependencies: ctags
Plug 'tomtom/tcomment_vim'

""Y:
Plug 'valloric/youcompleteme'

call plug#end()

"Vim Configuration
set completeopt-=preview
set nowrap
set number

syntax on

"Plugin Configurations

""Clang Format
autocmd FileType c,cpp,objc,h,hpp ClangFormatAutoEnable
autocmd FileType c,cpp,objc,h,hpp nnoremap <buffer><F4> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,h,hpp vnoremap <buffer><F4> :ClangFormat<CR>

""NERD Tree
nmap <F2> :NERDTreeToggle<CR>

""Tagbar
nmap <F3> :TagbarToggle<CR>
