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
Plugin 'ryanoasis/vim-devicons'
" ==== Completion
Plugin 'Valloric/YouCompleteMe'

" ==== Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-latex/vim-latex'
Plugin 'brgmnn/vim-opencl'
Plugin 'lepture/vim-jinja'
Plugin 'mxw/vim-jsx'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
"au BufNewFile,BufRead *.py,*.html,*.htm,*.shtml,*.stm set ft=jinja
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'szymonmaszke/vimpyter'

" ==== moving / searching
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
"Plugin 'szw/vim-tags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'atom/fuzzy-finder'

" ==== snippets
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'vim-scripts/DoxygenToolkit.vim'

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

" ==== Syntastic
let g:ycm_show_diagnostics_ui = 0
let g:ycm_register_as_syntastic_checker=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = ['python']
let g:syntastic_c_checkers = ['ycm','gcc']
let g:syntastic_cpp_checkers = ['ycm','cppcheck']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_c_include_dirs = ['inc','src','../inc','../src']
let g:syntastic_cpp_include_dirs = ['inc','src','../inc','../src']
let g:syntastic_auto_refresh_includes = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
"let g:syntastic_quiet_messages = {'level': 'warnings'} "don't display warnings



" === flake8
let g:flake8_show_in_file=1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

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

" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4
 " build tags of your own project with Ctrl-F12
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
 " OmniCppComplete
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
 " automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview

let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

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

