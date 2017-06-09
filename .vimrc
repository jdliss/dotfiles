"Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'                  "Let Vundle manage itself

" My bundles
Plugin 'ervandew/supertab'
Plugin 'skwp/greplace.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise' "appends an end for ruby blocks
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'  "allows pasting with a 'yo'
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/tComment'  "comment code
Plugin 'https://github.com/mattn/emmet-vim.git'

"Language Support copied from Josh Cheek

Plugin 'https://github.com/vim-ruby/vim-ruby'              " Ruby    - Pretty fkn legit (eg it's generally $LOAD_PATH aware, it's got some really awesome text objects)
Plugin 'https://github.com/tpope/vim-cucumber'             " Gherkin - Cucumber's DSL (Given / When / Then)

Plugin 'https://github.com/pangloss/vim-javascript'        " JavaScript     - The humans have turned this language into something to respect
Plugin 'https://github.com/kchmck/vim-coffee-script'       " CoffeeScript   - Syntactically, this is the language I always want to write, improved a lot of things from JavaScript, which they've largely incorporated in ES6
Plugin 'https://github.com/mxw/vim-jsx'                    " JSX (React.js) - Lets you write 'html' within your JavaScript

Plugin 'https://github.com/elixir-lang/vim-elixir'         " Elixir  - My brain summarizes it as 'Erlang with Ruby syntax', but that's probably selling it short
Plugin 'https://github.com/fatih/vim-go'                   " Go      - Forgot why I didn't keep playing with it,

Plugin 'https://github.com/tpope/vim-markdown'             " Markdown - A plain text format for barely structured documents
Plugin 'https://github.com/tpope/vim-haml'                 " Haml     - A better HTML
Plugin 'https://github.com/chrisbra/csv.vim'               " CSV      - a few nice features, some obvious ones missing

"From SnipMate's Github
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Elm
Plugin 'lambdatoast/elm.vim'

" Swift
Plugin 'https://github.com/keith/swift.vim'


" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/easysid/mod8.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Available are jellybeans and solarized
"colorscheme jellybeans
"syntax enable
"set background=dark
"colorscheme solarized

" ========================================================================
" Ruby stuff
" ========================================================================
syntax on                 " Enable syntax highlighting

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Enable built-in matchit plugin. Use %
  runtime macros/matchit.vim
  " ================

  let mapleader = "\<Space>"
  "let mapleader = ","

  set mouse=a
  set mouseshape=n:pencil
  set backspace=indent,eol,start " allow backspacing over everything in insert mode
  set history=1000
  set showcmd "display incomplete commands
  set showmatch
  "set wrap
  "set backupdir=~/.tmp
  set nobackup
  set noswapfile
  "set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
  set autoread
  set wmh=0
  set viminfo+=!
  set guifont=Triskweline_10:h10
  set guioptions-=T
  set wildmenu     "enables a menu at the bottom vim
  set wildmode=longest,list
  set et
  set sw=2
  set smarttab
  set incsearch    "search as characters are entered
  set ignorecase smartcase
  set laststatus=2  " Always show status line.
  set ruler
  set number
  " set relativenumber
  set cursorline  "highlight current line
  set showmatch    "highlight matching [{()}]
  set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
  set autoindent " always set autoindenting on
  set bg=light
  "set directory=.,$TEMP   "default for swap files, eliminates E303
  " set lazyredraw " Don't redraw screen when running macros.
  set guicursor+=n-v-c:blinkon0
  set updatecount=10                  "Save buffer every 10 chars typed
  set noerrorbells
  set scrolloff=5                     "won't scroll all the way down until 5
  set pastetoggle=<F10e
  set gdefault                       "auto replaces when pattern searching with :s/pattern/replacement. to turn off, add g at the end
  set sidescrolloff=5           " keep at least 5 lines left/right
  set cmdheight=2               " command line two lines high

  " solarized options
  if !has('gui_running')
    let g:solarized_termtrans=1
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
  endif
  "colorscheme mod8
  "colorscheme solarized
  colorscheme jellybeans
  set background=dark
  set t_Co=256                        " force vim to use 256 colors
  "let g:solarized_termcolors=256      " use solarized 256 fallback

  " Set the tag file search order
  set tags=./tags;

  " Use Silver Searcher instead of grep
  set grepprg=ag

  "to use erb tags globally - from tpop
  let g:surround_{char2nr('-')} = "<% \r %>"
  let g:surround_{char2nr('=')} = "<%= \r %>"

  " Make the omnicomplete text readable
  highlight PmenuSel ctermfg=black

  " Ignore stuff that can't be opened
  set wildignore+=tmp/**

  " Highlight the status line
  highlight StatusLine ctermfg=blue ctermbg=yellow


  set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

  set nofoldenable " Say no to code folding...

  "quick escape in insert and visual
  inoremap jk <Esc>
  vnoremap jk <Esc>

  "move vertically by visual line - won't skip over fake line 
  nmap k gk
  nmap j gj

  "save
  nnoremap <Leader>w :w<CR>

  " Ruby binding pry - insert binding.pry on the line above
  map <leader>bp Orequire "pry"; binding.pry<Esc>

  " Ruby binding pry - insert binding.pry on the line above
  map <leader>sop Osave_and_open_page<Esc>

  "
  " Ruby no pry - remove a binding.pry from the current file, hope it's the one you wanted
  map <leader>rbp /binding<cr>dd:noh

  "save to control + s"
  nnoremap <c-s> :w!<CR> # normal mode: save
  inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
  vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save
  "open up .vimrc with <leader>av (think: alter vimrc)
  nnoremap <leader>av :tabnew $MYVIMRC<cr>
  nmap <leader>vr :sp $MYVIMRC<cr>
  nmap <leader>so :source $MYVIMRC<cr>

  "disable arrow keys :-( tough love
  " noremap <Up> <NOP>
  " noremap <Down> <NOP>
  " noremap <Left> <NOP>
  " noremap <Right> <NOP>

  " Get off my lawn
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

  "indent whatever language - from DJ
  map <Leader>i mzggO<esc>=Gdd`z

  " ===== Window Navigation =====
  "  Move to window below me
  noremap <c-j> <c-w>j
  " Move to window above me
  nnoremap <c-k> <c-w>k
  " Move to window left of me
  nnoremap <c-h> <c-w>h
  " Move to window right of me
  nnoremap <c-l> <c-w>l

  "manage tabs
  nnoremap tn :tabnew<Space>
  nnoremap tk :tabnext<CR>
  nnoremap tj :tabprev<CR>
  nnoremap th :tabfirst<CR>
  nnoremap tl :tablast<CR>

  "make a vertical split with <leader>vv
  nnoremap <leader>vv :vsp<cr>

  " You know what I meant
  command! Q  q  " Bind :Q  to :q
  command! W  w  " Bind :W  to :w
  command! Wq wq " Bind :Wq to :wq
  command! WQ wq " Bind :WQ to :wq

  "changes status line to green when on insert mode - not useful when airline
  "mode is available - code from some youtube channel, can't recall which
  if version >= 700
    au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
    au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
  endif
  au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace


  """""""""""""""""""Emmet""""""""""""""""""""""""""""""""""""""""""""  
  let g:user_emmet_mode='a'    "enable all function in all mode
  imap   <C-q>,   <plug>(emmet-expand-word)
  imap   <C-y>u   <plug>(emmet-update-tag)
  imap   <C-y>d   <plug>(emmet-balance-tag-inward)
  imap   <C-y>D   <plug>(emmet-balance-tag-outward)
  imap   <C-y>n   <plug>(emmet-move-next)
  imap   <C-y>N   <plug>(emmet-move-prev)
  imap   <C-y>i   <plug>(emmet-image-size)
  imap   <C-y>/   <plug>(emmet-toggle-comment)
  imap   <C-y>j   <plug>(emmet-split-join-tag)
  imap   <C-y>k   <plug>(emmet-remove-tag)
  imap   <C-y>a   <plug>(emmet-anchorize-url)
  imap   <C-y>A   <plug>(emmet-anchorize-summary)
  imap   <C-y>m   <plug>(emmet-merge-lines)
  imap   <C-y>c   <plug>(emmet-code-pretty)


  function! SearchForCallSitesCursor()
    let searchTerm = expand("<cword>")
    call SearchForCallSites(searchTerm)
  endfunction

  " Search for call sites for term (excluding its definition) and
  " load into the quickfix list.
  function! SearchForCallSites(term)
    cexpr system('ag ' . shellescape(a:term) . '\| grep -v def')
  endfunction

  "Make CtrlP use ag for listing the files. Way faster and no useless files.
  " Without --hidden, it never finds .travis.yml since it starts with a dot

  "Make CtrlP use ag for listing the files. Way faster and no useless files.
  " Without --hidden, it never finds .travis.yml since it starts with a dot
  "  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  "  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

  """""""""""""""""""""NERDTree"""""""""""""""""""""""""""""""""""""""""""""""
  " open NERDTree when opening even without a specific file
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  "shortcut to opening NERDTree
  map <C-n> :NERDTreeToggle<CR>

  " close nerdtree if it's the last buffer open - from Scrooloose
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  "window resize from the default 31
  :let g:NERDTreeWinSize=25
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Test-running stuff
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "Now using thoughtbot/vim-rspec and tpope/dispatch.

  let g:rspec_command = "!clear && bin/rspec {spec}"
  "
  " RSpec.vim mappings
  "map <Leader>t :call RunCurrentSpecFile()<CR>
  "map <Leader>s :call RunNearestSpec()<CR>
  "map <Leader>l :call RunLastSpec()<CR>
  "map <Leader>a :call RunAllSpecs()<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  inoremap <Tab> <C-P>

  let g:CommandTMaxHeight=50
  let g:CommandTMatchWindowAtTop=1

  " Don't wait so long for the next keypress (particularly in ambigious Leader
  " situations.
  set timeoutlen=500

  " Remove trailing whitespace on save for ruby files.
  au BufWritePre *.rb :%s/\s\+$//e

  function! OpenFactoryFile()
    if filereadable("test/factories.rb")
      execute ":sp test/factories.rb"
    else
      execute ":sp spec/factories.rb"
    end
  endfunction

  " Set gutter background to black
  highlight SignColumn ctermbg=black

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " RENAME CURRENT FILE (thanks Gary Bernhardt)
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
  endfunction
  map <Leader>n :call RenameFile()<cr>

  " Display extra whitespace
  " set list listchars=tab:»·,trail:·
  set list listchars=tab:>.,trail:.,extends:#,nbsp:.

  " Switch syntax highlighting on, when the terminal has colors
  " Also switch on highlighting the last used search pattern.
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
  endif

  " Make it more obvious which paren I'm on
  hi MatchParen cterm=none ctermbg=black ctermfg=yellow

  " By default, vim thinks .md is Modula-2.
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " Without this, vim breaks in the middle of words when wrapping
  autocmd FileType markdown setlocal nolist wrap lbr

  " Wrap the quickfix window
  autocmd FileType qf setlocal wrap linebreak

  " Make it more obviouser when lines are too long
  highlight ColorColumn ctermbg=235

  " ========================================================================
  " End of things set by me.
  " ========================================================================

  " Only do this part when compiled with support for autocommands.
  if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
      au!

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

    augroup END

  endif
