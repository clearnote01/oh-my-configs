"
" ========== Documentation =============
"
"
" ========== Neovim configuration of Utkarsh Raj ============
" 
"
"
" Email: clearnote01@gmail.com 
"
"
" Neovim configuration of Utkarsh Raj 
" Contact at clearnote01@gmail.com 
" Or find me on facebook/gitter
call plug#begin('~/.vim/plugged')

" Plugins that are well tested go here
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " This is just insane
    Plug 'jonathanfilip/vim-lucius'
    Plug 'w0ng/vim-hybrid'
    Plug 'crusoexia/vim-dracula'
    Plug 'https://github.com/junegunn/limelight.vim' " Pretty light should not cause issues here
    "Plug 'junegunn/goyo.vim' " like a bit resource hungry ~20-30ms ??
    Plug 'vim-airline/vim-airline' ", {'on': [] }  Main resource consumer takes ~100ms
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    Plug 'tomasr/molokai'
    Plug 'vim-scripts/Solarized'
    "Plug 'morhetz/gruvbox'


" ========== Documentation =============
"
" FZF
" This is the default extra key bindings
" let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }

  Plug 'scrooloose/nerdcommenter'       
  Plug 'mattn/emmet-vim'
  Plug 'zchee/deoplete-jedi'
  Plug 'tpope/vim-fugitive'
  "Plug 'honza/vim-snippets'
  Plug 'https://github.com/Shougo/context_filetype.vim'
  Plug 'https://github.com/Shougo/neopairs.vim'
  Plug 'https://github.com/Konfekt/FastFold'
  "Plug 'https://github.com/Shougo/echodoc.vim'
  "Plug 'https://github.com/Shougo/neoinclude.vim'
  "Plug 'SirVer/ultisnips' , {'on': [] }
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

  "augroup load_us_ycm
  "autocmd!
  "autocmd InsertEnter * call plug#load('ultisnips') 
                     "\| autocmd! load_us_ycm
  "augroup END

" ========== Documentation =============
call plug#end()

" ==== Well tested settings =====

  inoremap jj <Esc>
  " Move selected lines up and down
  autocmd InsertEnter * :set nocul                                          "Remove cursorline highlight
  autocmd InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
  " This is too good
    let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
    let g:airline_theme = "distinguished"
    "let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
    "let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
    "let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
    let g:user_emmet_expandabbr_key = '<c-e>'
    let g:user_emmet_next_key = '<c-n>'


" ==== Mappings ======

    let mapleader=","
    nnoremap <c-p> :FZF<CR> 
    nnoremap tn :tabnew
    nnoremap tt :tabnew<CR>:FZF<CR>
    nnoremap tk :tabnext<CR>
    nnoremap tj :tabprevious<CR>
    nnoremap nh :nohlsearch<CR>
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq
    cnoreabbrev wQ wq
    cnoreabbrev QW wq
    cnoreabbrev qw wq
    cnoreabbrev W w
    nnoremap <leader>ls :source ~/nrc.vim<CR>
    nnoremap <leader>li :Limelight!!<CR>

" ===== Color Scheme ======
 
    set background=dark
     
    "Dark color scheme, not as good as below
    "color molokai
    "Light color scheme, absolute BOMB! (with patched Inconsolata!)
    "colorscheme lucius
    "LuciusLightHighContrast

" ===== Indentation data =====

    set autoindent
    set mouse= 
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set expandtab
    set smartindent
    set showcmd
    set nofoldenable
    autocmd FileType vim,html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 

" Good settings end here
 
source ~/.abbrev.vim
"set foldlevel=1 " Don't know what this does 
" Plugin modifications 
" UltiSnips not working till now with deoplete
" So i have turned it off
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsJumpBackwardTrigger=0
"
let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='powerlineish'


let g:fastfold_fold_command_suffixes = [] " Don't know if it works
" Use deoplete.
" commented for trial
let g:deoplete#enable_at_startup=1
if !exists('g:deoplete#omninput_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#sources#jedi#statement_lenght=0 " Remove this line to get docs on the top
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" omnifuncs
  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end

" For python deoplete configuration
  autocmd FileType python setlocal omnifunc=jedi#completions
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  "let g:deoplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

set cursorline
set fileformat=unix
"set foldenable          " Auto fold
"set foldmethod=indent
"set foldlevel=99
set hidden
set history=100
set ignorecase          " Ignore case in search 
set number
"set showmatch           " Match paranthesis
"set termguicolors
" Enable folding with space
" nnoremap <space> za
" Map leader to <space>
" <space> ls to load from vim config file
" tabNext tabPrev mapping
"nnoremap nc :let g:deoplete#disable_auto_complete=1<CR>
"let g:UltiSnipsEnableSnipMate=0
"
"
"
" --- Testing is done here hazardous
"
 
let g:delimitMate_expand_cr = 1

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
vnoremap _J :m '>+1<CR>gv=gv
vnoremap _K :m '<-2<CR>gv=gv
" Yank to the end of the line
nnoremap Y y$

colorscheme dracula

