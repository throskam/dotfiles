""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BASICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Languages
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Encoding
set encoding=utf8
set fileformats=unix,dos,mac

" Indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set smartindent

" Invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣,nbsp:+

" Line break
set wrap
set linebreak

" Args, buffers, windows and tabs
set showtabline=2
set nohidden
set autoread
set lazyredraw
set number
set relativenumber
set signcolumn=yes
set formatoptions+=j " Delete comment character when joining commented lines
set splitbelow
set splitright

" Moving around
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set switchbuf=useopen,usetab
set magic

" Autocomplete
set wildmenu
set wildignore+=**/.git
set wildignore+=**/node_modules
set wildignore+=**/vendor

" Remove backups
set nobackup
set nowritebackup
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Clipboard
set clipboard=unnamedplus

if has('macunix')
  set clipboard=unnamed
endif

" Misc
set timeoutlen=500
set history=500
set scrolloff=7
set foldlevel=99

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Allow to close netrw buffers
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif
augroup end

" Commands
command W w !sudo tee % > /dev/null
command -range JSON <line1>,<line2>!python3 -m json.tool

" Mapping
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>; :syntax sync fromstart<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <silent> <leader>, :noh<cr>

" Remove windows ^M
noremap <silent> <leader><cr> mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Remove trailing space
map <silent> <leader><space> :%s/\s\+$//e<cr>

" Windows moves
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-_> <c-w><c-_>
nnoremap <c-=> <c-w><c-=>

" Remap [ and ] to é and è respectively for azerty keyboard
nmap é [
nmap è ]
omap é [
omap è ]
xmap é [
xmap è ]
nmap éé [[
nmap èè ]]
omap éé [[
omap èè ]]
xmap éé [[
xmap èè ]]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic plug-vim install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Themes and colors
Plug 'dikiaap/minimalist'
" Plug 'altercation/vim-colors-solarized'
" Plug 'rakr/vim-one'
" Plug 'arcticicestudio/nord-vim'
" Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Commands and mappings
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'pseewald/vim-anyfold'
" Files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Buffers
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth', { 'on': 'Sleuth' }
" Syntax
Plug 'sheerun/vim-polyglot'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'vue', 'smarty']}
Plug 'dhruvasagar/vim-table-mode'
" Linting
Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'SirVer/ultisnips'
Plug 'throskam/my-vim-snippets'
call plug#end()

" Use solarized color scheme
set background=dark
" colorscheme solarized
" colorscheme one
" colorscheme nord
" colorscheme molokai
colorscheme minimalist

" Hardmode by default!
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" nnoremap <leader>e :HardTimeToggle<cr>

" Airline
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#coc#enabled = 1

" FZF goodies
map <leader>p :Files<cr>
map <leader>b :Buffers<cr>
map <leader>r :History<cr>
map <leader>m :Marks<cr>
map <leader>f :Ag!<cr>
map <leader>g :BLines!<cr>
map <leader>c :Commits!<cr>
map <leader>s :BCommits!<cr>
map <leader>h :History:<cr>
map <leader>? :Helptags<cr>

" DelimiteMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" AnyFold
autocmd Filetype * AnyFoldActivate

" Polyglot
let g:vue_disable_pre_processors = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/my-vim-snippets/UltiSnips"

" Ag - the silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden\ --ignore\ .git
  let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor --hidden --ignore .git -g ""'
  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
endif

" GitGutter
map <leader>: :GitGutter<cr>

" VimGo
" let g:go_imports_autosave = 1
" let g:go_list_height = 10
" let g:go_fmt_fail_silently = 1

" ALE
" let g:ale_linters = {'go': ['revive']}
" let g:ale_linters = {'go': ['golint', 'gofmt']}
" let g:ale_go_golangci_lint_options = 'enable-all --exclude-use-default=false'
" let g:ale_go_golangci_lint_options = '-D exhaustivestruct'
" let g:ale_go_golangci_lint_options = ''
" let g:ale_linter_aliases = {'typescript': ['vue', 'typescript']}
let g:ale_linters = {'vue': ['eslint', 'volar']}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\}
let g:ale_fix_on_save = 1
