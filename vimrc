""""""""""
""Robert""
""""""""""
5
" VIM and programming specific
syntax on
set nocompatible
set nowrap
set encoding=utf8
set nobackup
set noshowmode
set nowritebackup
set ruler
let mapleader = "\\"

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Enabling ELITE MODE
let g:elite_mode=1

" Automatic Plug installation script
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ##PLUG PLUGINS##

call plug#begin()

" #DISPLAY#
" Vim Airline: Status/Tabline
Plug 'vim-airline/vim-airline'

" Vim Airline Themes: Theme repository for Vim Airline
Plug 'vim-airline/vim-airline-themes'

" #NAVIGATION#
" NERD Tree: Tree file system explorer
Plug 'scrooloose/nerdtree'

" #PROGRAMMING UTILITIES#
" Ale: Syntax checking
Plug 'dense-analysis/ale'

" Auto Pairs: Adds missing character pairs, e.g. {}, ()
Plug 'jiangmiao/auto-pairs'

" Tagbar: Class outline viewer. Dependencies: ctags
Plug 'majutsushi/tagbar'

" Tcomment: Comment toggling
Plug 'tomtom/tcomment_vim'

" Universal Ctags: Generates an index file of language objects
Plug 'universal-ctags/ctags'

" Vim Clang Format: Format C/C++ files according to Clang Format
Plug 'rhysd/vim-clang-format'

" You Complete Me: Code completion engine
Plug 'valloric/youcompleteme'

" #SEARCH#
" Ack: Allows to use source code search tools like ack, ag or ripgrep in vim
Plug 'mileszs/ack.vim'

" #TEXT MANIPULATION#
" Tabular: Text alignment tool
Plug 'godlygeek/tabular'

" Vim Speed Dating: Increment dates, roman numerals and cardinals
Plug 'tpope/vim-speeddating'

call plug#end()

" ##VIM CONFIGURATION##
" No preview
set completeopt-=preview

" Show line numbers
set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Column highlighting
set colorcolumn=80,120
highlight ColorColumn ctermbg=235

" Invisible characters
set listchars=tab:▸\ ,eol:¬
highlight NonText ctermfg=DarkGrey cterm=NONE guifg=#262626 gui=NONE
highlight SpecialKey ctermfg=DarkGrey cterm=NONE guifg=#262626 gui=NONE
set list

" set list toggle
nmap <leader>l :set list!<CR>

" ##PLUGIN CONFIGURATIONS##

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Clang Format
autocmd FileType c,cpp,objc,h,hpp ClangFormatAutoEnable
autocmd FileType c,cpp,objc,h,hpp nnoremap <buffer><F4> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,h,hpp vnoremap <buffer><F4> :ClangFormat<CR>

" NERD Tree
nmap <F2> :NERDTreeToggle<CR>

" Tagbar
nmap <F3> :TagbarToggle<CR>

" ELITE MODE
if get(g:, 'elite_mode')
        nnoremap <Up>    :resize +2<CR>
        nnoremap <Down>  :resize -2<CR>
        nnoremap <Left>  :vertical resize +2<CR>
        nnoremap <Right> :vertical resize -2<CR>
endif
