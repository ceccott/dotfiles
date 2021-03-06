set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

let g:mapleader = '\'       " leader map
let g:camelcasemotion_key = '\'

xnoremap p pgvy             " multiple paste same buffer

" spellcheck switch
nnoremap <leader>s :set invspell<CR>

" Plugins
call plug#begin('~/.config/nvim/plugged')

"Plug 'foo/bar', {'on':[]} " plugin disable example

" Shortcuts and Movements
Plug 'ervandew/supertab'        " supertab
Plug 'tpope/vim-surround'             " quick surround extension
Plug 'jiangmiao/auto-pairs'           " automatic brackets pairing
Plug 'bkad/CamelCaseMotion'

" Syntax
"Plug 'nachumk/systemverilog.vim'      " verilog syntax
Plug 'vhda/verilog_systemverilog.vim' " system verilog syntax
Plug 'leafgarland/typescript-vim'     " typescript syntax support

" Code linting/checking/completing/commenting
Plug 'honza/vim-snippets'             " snippets db by language
Plug 'SirVer/ultisnips'               " snippets engine
Plug 'neomake/neomake'                " code checker
Plug 'tmhedberg/SimpylFold',{'on':[]} " code folding
Plug 'scrooloose/nerdcommenter'       " syntax-aware commenting and shortcuts
Plug 'OmniSharp/omnisharp-vim' "C# autocompletion
Plug 'zchee/deoplete-jedi'  " jedi connection to deoplete
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " autocomplete asynch framework
Plug 'ycm-core/YouCompleteMe'

" Misc
Plug 'scrooloose/nerdtree'            " file manager and explorer
Plug 'majutsushi/tagbar'              " function browser
Plug 'tpope/vim-fugitive'             " embedded git support
Plug 'vim-scripts/DoxygenToolkit.vim' " doxygen helper
Plug 'ludovicchabant/vim-gutentags'   " tags manager

" Styling
Plug 'morhetz/gruvbox'
Plug 'chrisbra/colorizer'
Plug 'christoomey/vim-tmux-navigator' " tmux navigation compatibility
Plug 'MattesGroeger/vim-bookmarks'    " enable lines bookmarking
Plug 'ryanoasis/vim-devicons'         " file icons for the manager
Plug 'vim-airline/vim-airline'        " status-bar customization
Plug 'vim-airline/vim-airline-themes' " vim-airline additional themes

call plug#end()


"- - - - - - - - - - - - - - - - Styling - - - - - - - - - - - - - - - - - -
colorscheme gruvbox
let g:airline_theme='luna'                          " status-bar vim-airline theme
set background =dark
set ruler
set relativenumber
"set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
" - - - - - - - - - - - - - - - Plugins settings  - - - - - - - - - - - - - -
" autocompletion
let g:deoplete#enable_at_startup = 1
let g:OmniSharp_server_stdio = 1

" `custom_snippets` is located in ~/.config/nivm
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" surround shortcuts mapping
nmap <M-s> ysiw
vmap <M-s> <S-s>

" git
set diffopt+=vertical


" toggle line comment on/off in normal and visual mode
vnoremap `` :call NERDComment(0,"toggle")<C-m>
nnoremap `` :call NERDComment(0,"toggle")<C-m>
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" code checking
call neomake#configure#automake('w')               " calls neomake automatically on buffer write

let g:neomake_cpplint_maker = {'args':['--filter=-whitespace/comments,-whitespace/comma,-runtime/explicit'] } " -whitespace/comma
"let g:neomake_pylint_maker = {'args':['--extension-pkg-whitelist=zmq']}
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_cpp_enabled_makers = ['cpplint']
let g:neomake_js_enabled_makers = ['jshint']

" bookmarking
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=22 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1


" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '\.meta']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
" toggle tree visibility
nnoremap <C-Space> :NERDTreeToggle<CR>
inoremap <C-Space> <C-o>:NERDTreeToggle<CR>
vnoremap <C-Space> <C-o>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree        " open tree automatically on startup

" navigation
nnoremap <C-]> g<C-]>
map  <C-n> :tabn<CR>
map  <C-p> :tabp<CR>
nmap <C-o> :TagbarToggle<CR>

" clipboards
set clipboard=unnamedplus

" terminal mode mappings
tnoremap <C-e> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" embedded terminal support
nnoremap <leader>T :sp term://zsh<CR>
nnoremap <leader>t :vsp term://zsh<CR>

" shortcuts
map <F5> :!make && make run<CR>
map <F7> :!make<CR>

" custom commands
:command Py !clear && python %
:command Py3 !clear && python3 %
:command M !make
:command R !make run
:command MR !make && make run
:command MC !make clean
:command Tv vs|:term
:command T  split|:term

" typo ignores
:command W w
:command Wa wa
:command Wq wq
:command WQ wq
:command Q q
:command Qa qa

" autocommands
autocmd BufWritePre * %s/\s\+$//e

