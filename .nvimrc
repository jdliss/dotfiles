call plug#begin()

Plug 'drewtempelmeyer/palenight.vim'
Plug '/usr/local/opt/fzf'
Plug 'dense-analysis/ale'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" TODO
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'davebrace/vim-testnav'

call plug#end()

set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }

" Keep Ale sign gutter open
let g:ale_sign_column_always = 1

" Ale - Don't highlight lines
let g:ale_set_highlights = 0

" Handle viewing dirs with vim-ranger
let g:ranger_replace_netrw = 1

" Prevent adding comment char on newline when hitting 'o' or <Enter> from a comment
au FileType * set fo-=c fo-=r fo-=o

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" turn off backups
set nobackup
set nowritebackup
set noswapfile

" use system clipboard
set clipboard=unnamedplus

" Set escape sequence
inoremap jk <Esc>
vnoremap jk <Esc>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" "

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" Set leader-pf and ctrl-p to open fuzzy finder
nnoremap <silent> <leader>pf :FZF <cr>
nnoremap <silent> <C-p> :FZF <cr>

" Configure Ranger keymappings
let g:ranger_map_keys = 0
map <leader><Tab> :Ranger<CR>

" Remap <leader>c<space> to gcc for NERDCommenter toggle comments
nmap gcc <leader>c<space>
vmap gc <leader>c<space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" show line numbers
set number

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" nvim extras
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
