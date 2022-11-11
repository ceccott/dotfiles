set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set cc=92                   " set an 92 column border for good coding style
set noswapfile 	            " prevents creation of swap files
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

let g:mapleader = '\'       " leader map
let g:camelcasemotion_key = '\'

" clipboards
set clipboard=unnamedplus
xnoremap p pgvy             " multiple paste same buffer

" spellcheck switch
nnoremap <leader>s :set invspell<CR>

" compatibility
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

" Plugins
call plug#begin('~/.config/nvim/plugged')

"Plug 'foo/bar', {'on':[]} " plugin disable example

" Shortcuts and Movements
"Plug 'ervandew/supertab'        " supertab
Plug 'tpope/vim-surround'       " quick surround extension
Plug 'jiangmiao/auto-pairs'     " automatic brackets pairing
Plug 'bkad/CamelCaseMotion'     " movements in camelcase strings
Plug 'MattesGroeger/vim-bookmarks'    " enable lines bookmarking

" Syntax
"Plug 'nachumk/systemverilog.vim'      " verilog syntax
Plug 'leafgarland/typescript-vim'      " typescript syntax support

" Code linting/checking/completing/commenting
Plug 'honza/vim-snippets'             " snippets db by language
Plug 'SirVer/ultisnips'               " snippets engine
Plug 'tmhedberg/SimpylFold',{'on':[]} " code folding
Plug 'scrooloose/nerdcommenter'       " syntax-aware commenting and shortcuts
Plug 'neovim/nvim-lspconfig'          " autocompletion
Plug 'williamboman/nvim-lsp-installer' " lsp install command addition
Plug 'nvim-lua/completion-nvim'       " autocompletion framework
Plug 'hrsh7th/nvim-compe'             " autocompletion

" Misc
Plug 'scrooloose/nerdtree'            " file manager and explorer
Plug 'majutsushi/tagbar'              " function browser
Plug 'tpope/vim-fugitive'             " embedded git support
Plug 'ludovicchabant/vim-gutentags'   " tags manager

" Styling
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chrisbra/colorizer'
Plug 'christoomey/vim-tmux-navigator' " tmux navigation compatibility
Plug 'ryanoasis/vim-devicons'         " file icons for the manager
Plug 'onsails/lspkind-nvim'           " dev icons for completion menu
Plug 'vim-airline/vim-airline'        " status-bar customization
Plug 'vim-airline/vim-airline-themes' " vim-airline additional themes

call plug#end()

"- - - - - - - - - - - - - - - - LspConfig + Autocomplete - - - - - - - - - - - - - - - - -

let g:completion_matching_strategy_list = ['exact','substring','fuzzy']
set completeopt=menuone,noinsert,noselect

lua <<EOF
-- require'lspconfig'.pyright.setup{on_attach=on_attach}
require'lspconfig'.pylsp.setup{
  settings={
    pylsp={
      plugins= {
        pylint = {
          enabled=true,
          executable = 'pylint'
        }
      }
    }
  },
  on_attach=on_attach
  }
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    ultisnips = true;
  };
}
-- Styling
require('lspkind').init({
      mode = 'symbol_text',
      preset = 'default'
})
EOF

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
" Better key bindings for UltiSnipsExpandTrigger
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snippets"]
"let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

inoremap <silent><expr> <c-q> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap dn <cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>

" surround shortcuts mapping
nmap <M-s> ysiw
vmap <M-s> <S-s>

" git
set diffopt+=vertical

" toggle line comment on/off in normal and visual mode
vnoremap `` :call nerdcommenter#Comment(0,"toggle")<C-m>
nnoremap `` :call nerdcommenter#Comment(0,"toggle")<C-m>

" bookmarking
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=22 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '\.meta', 'tags']

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

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

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
autocmd BufWritePre * %s/\s\+$//e
