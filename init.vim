call plug#begin('~/.vim/autoload')
" Here you put pluggins
" Make sure it's single quotes
" See more on plug.vim repo

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" -------- Themes ------------ '
Plug 'sainnhe/gruvbox-material'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'jremmen/vim-ripgrep'
Plug 'yggdroot/leaderf'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'yuttie/comfortable-motion.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'ap/vim-css-color'
Plug 'irrationalistic/vim-tasks'
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install'
  \ }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

"------------------ NEOVIM configuration BEGIN ---------------------
set relativenumber
set nu
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set nohlsearch
set autoindent
set copyindent
set noswapfile
set incsearch
set smartindent
set termguicolors
set background=dark
set updatetime=50
set cursorline
set clipboard=unnamedplus " Copy to system clipboard -> you need xsel installed
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"------------------ NEOVIM configuration END -----------------------

"---------------- NerdTree configuraton BEGIN ------------------
" Nerdtree map key, CTRL-n
nmap <C-n> : NERDTreeToggle<CR>

let NERDTreeShowHidden=1

let g:NERDTreeIgnore= ['^node_modules$']
let g:webdevicons_enable_nerdtree = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "D",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ----------------- NerdTree configuration END ---------------------

"------------------ Gruvbox-material configuration BEGIN -----------
" set background=light
" contrast, this should be above colorscheme
" let g:gruvebox_material_background = 'soft'
" available values: 'hard', 'medium' (default), 'soft'
let g:airline_theme = 'gruvbox_material'
colorscheme gruvbox-material
"----------------- Gruvbox-material configuration END ----------

" ---------------- DevIcons BEGIN -------------------------------
let g:airline_powerline_fonts=1
"  -------------- DevIcons END ---------------------------------

" --------------- Nerdcommenter BEGIN --------------------------
"  Had to map it to <C-_> because vim registers it as <C-/>
vmap <C-_> <leader>c<Space>
nmap <C-_> <leader>c<Space>
let NERDSpaceDelims=1
" --------------- Nerdcommenter END --------------------------

" --------------- LeaderF BEGIN ------------------------------
nnoremap <Leader>p :LeaderfFile<CR>
nnoremap <Leader>b :LeaderfBuffer<CR>
" --------------- LeaderF END ------------------------------

" --------------- ALE BEGIN ---------------------------------
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:airline#extensions#ale#enabled =1
" --------------- ALE END -----------------------------------

" --------------- Prettier BEGIN ----------------------------
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'true'
let g:prettier#config#print_width = 100
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#confg_precedence = 'file-override'
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.vue,*.graphql,*.yaml PrettierAsync
" --------------- Prettier END ------------------------------

" --------------- Deoplete BEGIN ----------------------------
let g:deoplete#enable_at_startup = 1
" let g:deoplete#num_processes = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" --------------- Deoplete END ------------------------------

" --------------- RIP GREP ----------------------------------
if executable('rg')
  let g:rg_derive_root='true'
endif

nnoremap <Leader>s :Rg --ignore-case<SPACE>
" --------------- RIP GREP END ------------------------------
 
" --------------- Vim Smoothe Scroll BEGIN ------------------
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" --------------- Vim Smoothe Scroll END --------------------

" --------------- Vim Fugitive BEGIN ------------------------
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
" --------------- Vim Fugitive END --------------------------

" --------------- Quickscope BEGIN --------------------------
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150
" --------------- Quickscope END ----------------------------
