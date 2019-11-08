set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set encoding=UTF-8

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" ==== helpers
Plugin 'vim-scripts/L9'

" ==== File tree
Plugin 'scrooloose/nerdtree'

" ==== Git
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'tpope/vim-surround'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'plasticboy/vim-markdown'
Plugin 'MattesGroeger/vim-bookmarks'

" ==== moving / searching
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'atom/fuzzy-finder'

" Status bar on bottom
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
" ==== PLUGIN THEMES
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
colorscheme gruvbox
set guifont=Droid\ Sans\ Mono:h16

"set fillchars+=vert:\
syntax enable
set background=dark
set ruler
set hidden

set number "hybrid numbering
set relativenumber

set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999
set listchars=tab:▸\ ,eol:¬

:set autoread  "automatically refreshed file edited outside Vim

set hlsearch
set incsearch
set ignorecase

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-@> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure
nnoremap <leader>\ :silent make\|redraw!\|cc<CR>

" ==== highlight with modeline ===
set modelines=5

"avoid vim from cluttering the current folder with swap files
set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/tmp

"customizing plugins
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=22 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

"custom remaps
vnoremap `` :call NERDComment(0,"toggle")<C-m>
nnoremap `` :call NERDComment(0,"toggle")<C-m>
nnoremap <C-]> g<C-]>
map  <C-n> :tabn<CR>
map  <C-p> :tabp<CR>
nmap <C-o> :TagbarToggle<CR>
"F<n> keys mapping
map <F5> :!make && make run<CR>
map <F7> :!make<CR>

"jupyter mappings
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

"set buffer to system clipboard
set clipboard=unnamedplus

"custom autocmd
"removes trailing spaces on savep
autocmd BufWritePre * %s/\s\+$//e

"vim custom run
:command Py !clear && python %
:command Py3 !clear && python3 %
:command M !make
:command R !make run
:command MR !make && make run
:command MC !make clean

