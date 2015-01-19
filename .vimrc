set nocompatible               " be iMproved
filetype off                   " required!

" non standard bash
set shell=/bin/sh

" for my broken hand...
set mouse=a

set t_ut=

" for 'b'
set iskeyword-=_

" for system clipping
if $TMUX == ''
  set clipboard=unnamed
endif


" Core
"
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-unimpaired'
Plug 'skwp/vim-easymotion'
Plug 'vim-scripts/ZoomWin'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-ragtag'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimshell.vim'
Plug 'roman/golden-ratio'
Plug 'suan/vim-instant-markdown'
Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'int3/vim-extradite'
Plug 'tpope/vim-commentary'

" experimenting
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'justinmk/vim-gtfo'
Plug 'Keithbsmiley/investigate.vim'
Plug 'junegunn/vim-after-object'
Plug 'nathanaelkane/vim-indent-guides'

" external
Plug 'marijnh/tern_for_vim'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe'
Plug 'sjl/vitality.vim'

"language specific
Plug 'juvenn/mustache.vim'
Plug 'drichard/vim-brunch'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'klen/python-mode'
Plug 'nono/vim-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'


" ios
Plug 'eraserhd/vim-ios/'
Plug 'msanders/cocoa.vim'
Plug 'toyamarinyon/vim-swift'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ejs set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
filetype indent on     " required!

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving and exiting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" keep on same column
set nostartofline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=3

" Turn on the WiLd menu
set wildmenu

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

"Always show current position
set ruler
set number
set cursorline

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

nmap // :noh<CR>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
set foldcolumn=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &term!="xterm"
  set t_Co=256            " use 256 colors in vim
  colorscheme fu   " an appropriate color scheme
endif

syntax enable
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac"

if has("mac") || has("macunix")
  set gfn=Menlo:h14
  set shell=/bin/bash
elseif has("win16") || has("win32")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

" character limit
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn ctermbg=233 ctermbg=233 guibg=#1a1a1a guifg=#1a1a1a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable javascript code folding
au FileType javascript call JavaScriptFold()

" automatically remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
" set tw=500

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" remove tabs when pasting
set pastetoggle=<F2>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map C-w to splitting in that direction
" map <C-w>j :bel sp. <cr>
" map <C-w>k :sp. <cr>
" map <C-w>l :bel vs. <cr>
" map <C-w>h :vs. <cr>

" Map Control-# to switch tabs
map  \0 0gt
map  \1 1gt
map  \2 2gt
map  \3 3gt
map  \4 4gt
map  \5 5gt
map  \6 6gt
map  \7 7gt
map  \8 8gt
map  \9 9gt
imap \0 <Esc>0gt
imap \1 <Esc>1gt
imap \2 <Esc>2gt
imap \3 <Esc>3gt
imap \4 <Esc>4gt
imap \5 <Esc>5gt
imap \6 <Esc>6gt
imap \7 <Esc>7gt
imap \8 <Esc>8gt
imap \9 <Esc>9gt


" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap ]l :ls<CR>

nnoremap ]1 :1b<CR>
nnoremap ]2 :2b<CR>
nnoremap ]3 :3b<CR>
nnoremap ]4 :4b<CR>
nnoremap ]5 :5b<CR>
nnoremap ]6 :6b<CR>
nnoremap ]7 :7b<CR>
nnoremap ]8 :8b<CR>
nnoremap ]9 :9b<CR>
nnoremap ]0 :10b<CR>
nnoremap [1 :1b<CR>
nnoremap [2 :2b<CR>
nnoremap [3 :3b<CR>
nnoremap [4 :4b<CR>
nnoremap [5 :5b<CR>
nnoremap [6 :6b<CR>
nnoremap [7 :7b<CR>
nnoremap [8 :8b<CR>
nnoremap [9 :9b<CR>
nnoremap [0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Adjust viewports to the same size
map <Leader>= <C-w>=

" mappings to access buffers, [b and ]b for back and forward,
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
" [v, ]v, go to last visited buffers
nnoremap [v :e#<CR>
nnoremap ]v :e#<CR>

" delete current buffer
nnoremap \bd :Kwbd<CR>

nnoremap \bq :bd<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
map g0 :call cursor(0, len(getline('.'))/2)<CR>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
map <leader>; A;<ESC>



""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
" set guioptions-=r
" set guioptions-=R
" set guioptions-=l
" set guioptions-=L

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Bash like keys for insert mode
inoremap <C-A> <Home>
inoremap <C-E> <End>

" Map auto complete of (, ", ', [
" inoremap ( ()<esc>i
" inoremap [ []<esc>i
" inoremap { {}<esc>i
" inoremap {<CR> {<CR>}<esc>O
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
" inoremap < <><esc>i

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn persistent undo on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.files/temp/undos
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni complete functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
let g:yankring_history_dir = '~/.files/temp/'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>CommentaryLine


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
" always opens the buffer for the file if it already exists
set hidden

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" TODO: Gives an error when :so %
" " If the parameter is a directory, cd into it
" function s:CdIfDirectory(directory)
"   let explicitDirectory = isdirectory(a:directory)
"   let directory = explicitDirectory || empty(a:directory)

"   if explicitDirectory
"     exe "cd " . fnameescape(a:directory)
"   endif

"   " Allows reading from stdin
"   " ex: git diff | mvim -R -
"   if strlen(a:directory) == 0
"     return
"   endif

"   if directory
"     NERDTree
"     wincmd p
"     bd
"   endif

"   if explicitDirectory
"     wincmd p
"   endif
" endfunction

" " NERDTree utility function
" function s:UpdateNERDTree(...)
"   let stay = 0

"   if(exists("a:1"))
"     let stay = a:1
"   end

"   if exists("t:NERDTreeBufName")
"     let nr = bufwinnr(t:NERDTreeBufName)
"     if nr != -1
"       exe nr . "wincmd w"
"       exe substitute(mapcheck("R"), "<CR>", "", "")
"       if !stay
"         wincmd p
"       end
"     endif
"   endif
" endfunction

" hijack netrw
let NERDTreeHijackNetrw=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
map <C-p> :CtrlP<CR>
imap <C-p> <ESC>:CtrlP<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|venv|bower_components',
  \ 'file': '\v\.(exe|so|dll|swp|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>rt :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>dg :diffget<CR>
map <leader>du :diffupdate<CR>
map <leader>gr :Gread<CR>
map <leader>gw :Gwrite<CR>
map <leader>gl :Glog<CR>
map <leader>gc :Gcommit<CR>
map <leader>gP :Git pull
map <leader>gp :Git push
map <leader>g :Git

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>z :ZoomWin<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ragtag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ragtag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplCheckDupeBufs = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GoldenRatio
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :GoldenRatioToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='jellybeans'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
let g:pymode_lint_ignore = "E501"

" Select errors and warnings
" E.g. "E4,W"
let g:pymode_lint_select = ""

" Run linter on the fly
let g:pymode_lint_onfly = 0

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = ""

let g:pymode_rope_always_show_complete_menu = 0

" Enable python folding
let g:pymode_folding = 1

" Enable python objects and motion
let g:pymode_motion = 1

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Additional python paths
let g:pymode_paths = []

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Enable pymode indentation
let g:pymode_indent = 1

" Set default pymode python options
let g:pymode_options = 1

" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0

" for coffeetags: https://github.com/lukaszkorecki/CoffeeTags/issues



" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>a :Ack<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" extradite.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tg :Extradite<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_autosave = 0

"""""""""""""""""""""""
" indentGuide
"""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234 guibg=#1a1a1a guifg=#1a1a1a
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235 guibg=#1a1a1a guifg=#1a1a1a








"""""""""""""""""""""""""""""""""""""
" SCRIPTS
"""""""""""""""""""""""""""""""""""""

" http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

