" Remap leader key so my pinky can rest
let mapleader=','


set nocompatible               " just in case
filetype off                   " required!

set shell=/bin/sh  " non standard shell

"""""""""""""""""""""""""""""""""
""" Files, backups and undo
"""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway.
set nobackup
set nowb
set noswapfile

" Turn persistent undo on
try
  " YMMV: Optional
  " set undodir=~/.files/temp/undos
  set undofile
catch
endtry

" Uncomment if your hand is broken
" set mouse=a

" Background color erase.
" Useful for maintaining color themes in tmux/GNU
" set t_ut=

" when going forward and backward ('b', 'e'), allow underscores to be
" recognized as keywords
set iskeyword-=_

" always show status bar
set laststatus=2

" for system clipping - even in tmux
set clipboard=unnamed

""""""""""""""""""""""
"""""""  Core  """""""
""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/fu'                           " THE COLORS DUKE ~
Plug 'zhaocai/GoldenView.Vim'                   " Nice resizing for buffers. Replaces roman/golden-ratio
Plug 'junegunn/fzf',                            " ridiculously fast file search. Replaces ctrlP.
      \ { 'dir': '~/.fzf',
      \   'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'                      " File explorer
" TODO: https://github.com/neomake/neomake
Plug 'scrooloose/syntastic'                     " Syntax highlighting.
Plug 'tpope/vim-fugitive'                       " Incredibly useful git bindings
Plug 'itchyny/lightline.vim'                    " Status line! Replaces vim-airline & powerline
Plug 'ap/vim-buftabline'                        " Top of the window list of buffers. Replaces vim-airline functionality
Plug 'tpope/vim-unimpaired'                     " a set of nice keyboard mappings
Plug 'tmhedberg/matchit'                        " Better % mapping, in particular - HTML
Plug 'tpope/vim-ragtag'                         " Mappings for HTML! And other stuff.
Plug 'tpope/vim-surround'                       " Useful keybindings for modifying surrounding pairs (), [], '', etc
Plug 'easymotion/vim-easymotion'                " fast search and navigation. I mainly use it to replace /
                                                " For a lightweight alternative, see vim-sneak
Plug 'tpope/vim-repeat'                         " basically to just support tpope's plugins
Plug 'Shougo/neocomplete.vim'                   " Auto completion. Replaces YouCompleteMe.
Plug 'ConradIrwin/vim-bracketed-paste'          " fixes copy pasting.
Plug 'junegunn/vim-easy-align'                  " Align all the things! Replaces 'godlygeek/tabular'
Plug 'tpope/vim-commentary'                     " comment stuff out!
Plug 'nathanaelkane/vim-indent-guides'          " show where your indents are! Replaces Yggdroot/indentLine
Plug 'Valloric/MatchTagAlways'                  " always show which tags are highlighted.
                                                " WARNING: may affect scroll performance!!
Plug 'sjl/vitality.vim'                         " make vim play nicely with iterm + tmux

" language specific syntax/convenience plugins:
Plug 'othree/html5.vim'
Plug 'juvenn/mustache.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'nono/vim-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'dag/vim-fish'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/ShaderHighLight'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'plasticboy/vim-markdown'

" for writing:
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" In flux...
Plug 'jiangmiao/auto-pairs'       " Plug 'Raimondi/delimitMate'

" YMMV plugins. Only occasionally used. Removed to improve experience.
" Plug 'chrisbra/NrrwRgn'
" Plug 'airblade/vim-gitgutter'
" Plug 'mileszs/ack.vim'
" Plug 'Keithbsmiley/investigate.vim'
" Plug 'junegunn/vim-after-object'
" Plug 'Shougo/vimshell.vim'
" Plug 'Shougo/vimproc'
" Plug 'reedes/vim-pencil'
" Plug 'marijnh/tern_for_vim'
" Plug 'justinmk/vim-gtfo'
" Plug 'junegunn/vim-emoji'
" Plug 'mattn/emmet-vim'
" Plug 'majutsushi/tagbar'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin on
filetype indent on     " required!

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving and exiting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>


"""""""""""""""""""""""""""""""
""" VIM user interface
"""""""""""""""""""""""""""""""

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
" set cursorline

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

" quickly clear search results
nmap // :noh<CR>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw
" disabling syntax highlighting after 128 columns and/or minlines set to 256.
" Might help performance.
set synmaxcol=128
syntax sync minlines=256

set nocursorcolumn
set nocursorline
set norelativenumber

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


""""""""""""""""""""""""""""""""
""" Colors and Fonts
""""""""""""""""""""""""""""""""

" may help with linux terminal colors
set term=xterm-256color
set t_Co=256

set background=dark
let g:solarized_termtrans = 1

" colorscheme peaksea   " an appropriate color scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme fu

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ff=unix

if has("mac") || has("macunix")
  set gfn=Menlo:h14
  set shell=/bin/bash
elseif has("win16") || has("win32")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

" YMMV: highlight the character limit. You may have to alter the colors.
execute "set colorcolumn=" . join(range(80,335), ',')
hi ColorColumn ctermbg=233 ctermbg=233 guibg=#1a1a1a guifg=#1a1a1a


""""""""""""""""""""""""""""""""""
""" Text, tab and indent related
""""""""""""""""""""""""""""""""""
" enable javascript code folding
" au FileType javascript call JavaScriptFold()

" automatically remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" YMMV: Linebreak on 500 characters
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
""" Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""
""" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Map C-w to splitting in that direction
" map <C-w>j :bel sp. <cr>
" map <C-w>k :sp. <cr>
" map <C-w>l :bel vs. <cr>
" map <C-w>h :vs. <cr>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" mappings to access buffers, [b and ]b for back and forward,
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>

" [v, ]v, go to last visited buffers
nnoremap [v :e#<CR>
nnoremap ]v :e#<CR>

" delete current buffer
nnoremap <Leader>bd :bd<CR>

nnoremap <Leader>bq :bd<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Editing mappings
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

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Bash like keys for insert mode
inoremap <C-A> <Home>
inoremap <C-E> <End>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni complete functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Writing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shift tab to unindent (command mode only)
nnoremap <S-Tab> <<






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => vim-easy-align - https://github.com/junegunn/vim-easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary - https://github.com/tpope/vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>c <Plug>Commentary
nmap <leader>c <Plug>CommentaryLine


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree - https://github.com/scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
" always opens the buffer for the file if it already exists
set hidden

let NERDTreeIgnore=[
  \ '\.pyc$',
  \ '\.pyo$',
  \ '\.rbc$',
  \ '\.rbo$',
  \ '\.class$',
  \ '\.o$',
  \ '\~$',
  \ '.jpg$',
  \ '.jpeg$',
  \ '.png$',
  \ '.psd$',
  \ '.gif$',
  \ '.woff$',
  \ '.ttf$',
  \ '.otf$'
  \ ]

" hijack netrw
let NERDTreeHijackNetrw=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf + fzf.vim - https://github.com/junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" looks for project root - see https://github.com/junegunn/fzf/issues/369
function! s:find_root()
  for vcs in ['.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'Files' dir
      return
    endif
  endfor
  Files
endfunction

command! FZFR call s:find_root()

map <C-p> :FZFR<CR>
map <C-o> :FZF<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo - https://github.com/junegunn/goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gy :Goyo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Limelight - https://github.com/junegunn/limelight.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ll :Limelight<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive - https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gb :Gblame -w<CR>
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
map <leader>g<Space> :Git<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ragtag - https://github.com/tpope/vim-ragtag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GoldenView - https://github.com/zhaocai/GoldenView.Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goldenview__enable_default_mapping = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic - https://github.com/scrooloose/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_ocaml_checkers=['merlin']
let g:syntastic_mode_map = {
      \ "mode": "passive"
      \ }

map <leader>ss :Errors<CR>
map <leader>sc :lclose<CR>
map <leader>sr :SyntasticCheck<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides - https://github.com/nathanaelkane/vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234 guibg=#1a1a1a guifg=#1a1a1a
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235 guibg=#1a1a1a guifg=#1a1a1a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs - https://github.com/jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:AutoPairsFlyMode = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion - https://github.com/easymotion/vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:EasyMotion_smartcase = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplete - https://github.com/Shougo/neocomplete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =
\ '[^. *\t]\.\w*\|\h\w*::'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ejs set filetype=html


"""""""""""""""""""""""""""""""
" JSX
"""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0


