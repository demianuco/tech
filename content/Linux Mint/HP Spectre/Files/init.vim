"/==============================================================================
" neovim/vim settings
"
" Init {{{1
"
" Curated by Demian Martinez <demianuco@gmail.com>.
" Optimized for WSL Development.
"
" Inspired by many sources, including:
"   - https://github.com/mhinz/vim-galore
"   - https://github.com/ddrscott/config-nvim/blob/master/init.vim
"
" Vim scripting:
"   https://github.com/rstacruz/cheatsheets/blob/master/vimscript.md
"   http://learnvimscriptthehardway.stevelosh.com/
"
" Helpful lists:
"   :scriptnames            : list all plugins, _vimrcs loaded (super)
"   :verbose set history?   : reveals value of history and where set
"   :function               : list functions
"   :func SearchCompl       : List particular function

" Configure tabs and folds for this file
if !exists('viminit_autocmd_loaded')
let viminit_autocmd_loaded=1
augroup viminit
  " Use 2 space indentation
  autocmd FileType vim :setlocal ts=2 sts=2 sw=2 et
  " Fold using markers
  autocmd FileType vim :setlocal foldmethod=marker
augroup END
endif

" Reset leader
"   The default mapleader key is '\', but this is hardly useful.
"
"   The second option for the map leader is ';', which keeps the fingers in the
"   ome row. This worked well for a while, but it interferes with the default
"   ';' (which repeats a forward find).
"
"   The best option (for now) is to use the <Space> key. This can be reached
"   comfortably with either thumb from any position. The only problem is that it
"   does not show in the status bar when you press it. To overcome this problem,
"   instead of setting the 'mapleader' to space directly, the recommended
"   workaround is to leave the 'mapleader' variable to the default value (i.e.
"   \) and instead map the <Space> key to the <Leader> key. The effect is to
"   have the <Space> key act as the leader key, but to have '\' show up in the
"   status bar when <Space> is used.
"
"let mapleader=";"
map <Space> <Leader>

" Helpers to edit/source this file
nnoremap <Leader>ev :tabnew $MYVIMRC<CR>
command! EV tabnew $MYVIMRC
command! SV source $MYVIMRC



" Plug {{{1
" ------------------------------------------------------------------------------
"   See https://github.com/junegunn/vim-plug for full instructions.
"   See https://vimawesome.com/ for a good plugin repository.
"
" Commands
"    PlugInstall [name ...] Install plugins
"    PlugUpdate [name ...]  Install or update plugins
"    PlugClean[!] 	        Remove unused directories (bang version will clean without prompt)
"    PlugUpgrade 	        Upgrade vim-plug itself
"    PlugStatus 	        Check the status of plugins

" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load Plugins
let s:isdev=0
call plug#begin()

" Default
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" Colorscheme
" Plug 'sonph/onehalf'
Plug 'mhartington/oceanic-next'
" Plug 'tomasr/molokai'
" Plug 'nanotech/jellybeans.vim'

" File explorer
"   https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-buffer-ops'

" Fast searching and general awesomeness
if executable('fzf')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

" Development
if s:isdev == 1

  " Git
  Plug 'tpope/vim-fugitive'

  " File types / Syntax highlighting
  " let g:polyglot_disabled = ['csv']
  " Plug 'sheerun/vim-polyglot'
  " Plug 'moll/vim-node'
  " Plug 'lifepillar/pgsql.vim'
  " Plug 'othree/yajs.vim'
  " Plug 'herringtondarkholme/yats.vim'
  " Plug 'heavenshell/vim-jsdoc'
  " Plug 'amadeus/vim-mjml'

endif

" Script development
"Plug 'tpope/vim-scriptease'           # Enabled when needed

"-----------------------------------------------------------------------------
" Editing
"
"   godlygeek/tabular
"     Align by regex
"   tpope/vim-unimpaired
"     Provide bracket maps, fast option toggling and other goodness.
"   tpope/vim-surround
"     Add, change, delete surrounding quotes, braces, etc.
"   vim-scripts/ReplaceWithRegister
"     Use gr{motion} to paste without modifying register
"   michaeljsmith/vim-indent-object
"     Select by indent level using 'ii', 'ai', 'aI' text objects.
"   tpope/vim-commentary
"     Comment/uncomment using 'gcc', 'gc', 'gC'.
"   stefandtw/quickfix-reflector.vim
"     Edit the quickfix and see changes apply to the original files!
"   machakann/vim-highlightedyank
"     Highlights the yanked area.
"   chrisbra/colorizer
"     Turns colors codes (hex or otherwise) into colors.
"   fidian/hexmode
"     Hex text editor. Use :Hexmode to toggle into it.

Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'chrisbra/colorizer'
Plug 'fidian/hexmode'

"-----------------------------------------------------------------------------
" Misc
"

" atweiden/vim-vmath
"   Calculates sum, avg, min, max and count of visual selection
"   Select numbers in multiple lines and then <Leader>++
Plug 'atweiden/vim-vmath'

"-----------------------------------------------------------------------------
" Status line
"
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()



" General Settings {{{1 -----------------------------------------------------------------------------

" Make Vim behave like NeoVim
" See https://neovim.io/doc/user/vim_diff.html
set autoread
set belloff=all
set display=lastline
set laststatus=2
set mousemodel=popup_setpos
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal,unix,slash
set switchbuf=uselast
set tabpagemax=50
set viewoptions=folds,cursor,curdir,unix,slash
set viminfo='20,"50,!

" Visuals
syntax on                  " (Neovim default)
set synmaxcol=200          " Max colors to syntax hightlight (for speed)
set number                 " Show line numbers
set relativenumber         " Show relative line number
set cursorline             " Highlight cursor line
" set colorcolumn=80,100     " Show faint vertical col_originals
set nolist                 " Don't show unprintable characters by default
if has('nvim')
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,space:·,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=eol:¶,tab:>·,trail:˽,extends:>,precedes:<,nbsp:˽
endif

" Buffers, Windows
set hidden                 " Switch between buffers without having to save first.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
"set noequalalways         " Don't resize windows equally upon open/close.
"set winheight=10
"set winwidth=80
"set winminheight=1
"set winminwidth=5

" Movement/scrolling
set whichwrap=b,s,h,l,<,>,[,] " Allow certain keys to move to previus/next line.
set nostartofline             " Don't move to start-of-line for many movement commands.
set scrolloff=2               " Context lines to keep above/below cursor
set sidescroll=5              " Horizontally scroll minimum step.
set mouse=nvirh               " Enabled mouse in all modes except command

" Wrapping
"set textwidth=80           " Width for hard wraping (if enabled) and autoformat.
set nowrap                 " Wraps long lines (display only, no EOL is inserted!).
set nolinebreak            " Wrapping at last char, not at word boundary.
set lazyredraw             " Reduce screen flicker
set breakindent            " Wrapped lines should be indented the same as parent.
set showbreak=->\          " Wrapped lines end with an arrow + space (note the escaped space)
"set showbreak=↪
set breakindentopt=sbr,shift:4

" Indentation
set autoindent             " (Neovim default) Indent according to previous line.
set smarttab               " (Neovim default) Insert start-of-line tabs as per 'shiftwidth'.
set tabstop=4              " Spaces per tab.
set softtabstop=4          " Tab key indents by 4 spaces.
set shiftwidth=4           " >> indents by 4 spaces.
set expandtab              " Use spaces instead of tabs.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

" Searching
set hlsearch               " (Neovim default) Highlight search matches
set incsearch              " (Neovim default) Show matches as you type
set ignorecase smartcase   " Ignore case (but only if everything is lowercase)
set wrapscan               " (Neovim default) Searches around end of file

" Folding
"set foldmethod=marker      " (Default: Manual) Folds according to markers
set foldopen+=jump         " When should fold open? Add jumps ("G", "gg", etc.)

" Diffing
set diffopt+=vertical,foldcolumn:0
"set diffopt+=vertical,foldcolumn:0,indent-heuristic,algorithm:patience

" Completion, Spelling
set complete=.,w,b,u,t,kspell
set spelllang=en           " (Neovim default)
set spellfile=~/.config/nvim/spell/en.utf-8.add

" Toggle Paste mode
" set pastetoggle=<F3>

" Misc
set nojoinspaces           " Only insert one space when joining lines.
set virtualedit=block
set timeoutlen=600         " Shorten timeout after last key before a command is executed (for speed)
set ttimeoutlen=20        " Shorten timeout for second key in a key sequence (for speed)

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest,full
set wildignore=
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.bak,*.exe,target,tags,gem.tags
set wildignore+=*.pyc,*.DS_Store,*.db,*.min.js
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**
set wildignore+=*.js.map,ui/public/client/*,cassettes/**,node_modules/**
" }}}

" Expand aliases when using Vim's non-interactive shell
"   This will allow, for example, using ":read !aliasedcommand".
"   See https://stackoverflow.com/a/19819036
let $BASH_ENV = "~/.bash_aliases"

" On exiting Vim, set cursor to vertical line.
"   Otherwise the calling terminal session will be left with the cursor that vim
"   had at the time of exiting (a block in normal mode). This is a bug that
"   might be fixed in the future.
"   See https://github.com/neovim/neovim/issues/4867#issuecomment-291249173
:au VimLeave * set guicursor=a:ver25-blinkon0



" Colorschemes, Highlights {{{1
" ------------------------------------------------------------------------------

" Colorscheme
" colorscheme onehalfdark
colorscheme OceanicNext
" colorscheme molokai
" colorscheme jellybeans
set background=dark
set termguicolors          " Set truecolor

" Font
" set guifont="Consolas:h11:cANSI"

" Cursor
"   Enable blinking until 'Windows Terminal' fixes bug where solid cursor
"   prevents seeing character under it.
" set guicursor=n-v-c-sm:block-blinkwait300-blinkon300-blinkoff300,i-ci-ve:ver25,r-cr-o:hor25
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor25

" Custom highlights {{{2

" Place all custom highlights in this function.
"   See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
function! MyHighlights(afile, amatch) abort

" echom 'MyHighlights called! <afile>: ' . a:afile . ' / <amatch>: ' . a:amatch

" Increase contrast of cursorline and cursorcolumn
" (Default for JellyBeans is #1c1c1c)
highlight CursorLine   guibg=#2c2c2c
highlight CursorColumn guibg=#2c2c2c

" Note: There is no easy way to override the hightlight groups used by the
" lightline plugin. After some exploration and trial and error, I have found
" that the easiest way is to directly hack the original plugin file that can
" be found at:
"
"   !/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/powerline.vim
"
" To make the selected tabline tab stand out more, use the following:
"
"   let s:p.tabline.tabsel = [ [ 'white', 'darkblue' ] ]

endfunction

" augroup MyColors
"     autocmd!
"     autocmd ColorScheme * call MyHighlights(expand('<afile>'), expand('<amatch>'))
" augroup END

" }}}2



" Buffers {{{1
" ------------------------------------------------------------------------------

" Moving between buffers
"   [b  : bprevious (from 'unimpaired')
"   ]b  : bnext     (from 'unimpaired')
"   [B  : bfirst    (from 'unimpaired')
"   ]B  : blast     (from 'unimpaired')

" Closing buffers
"   bd  : Buffer Delete (will fail if pending changes)
"   bD  : Buffer Delete (Forced! Will loose pending changes!)
"   bo  : Buffer Only (hide other windows)
"   bO  : Buffer Only (delete other buffers, unless dirty)
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bD :bd!<CR>
nnoremap <Leader>bo :only<CR>
nnoremap <silent> <Leader>bO mB:update<CR>:%bdelete<CR>`B:bdelete#<CR>

" Creating buffers
"   bn  : Buffer New
"   bs  : Buffer Vertical Split (as with NERDTree)
"   bi  : Buffer Horizontal Split (as with NERDTree)
"   bt  : Buffer Tab Split (as with NERDTree)
nnoremap <Leader>bn :vnew<CR>
nnoremap <Leader>bs :vsplit<CR>
nnoremap <Leader>bi :split<CR>
nnoremap <Leader>bt :tabedit %<CR>

" Alternate buffers
"   ba  : Buffer Alternate (jumpt to alternate buffer)
nnoremap <Leader>ba :b #<CR>

" Jump out until buffer changes
"   See https://github.com/ddrscott/config-nvim/blob/master/init.vim#L272
nnoremap <silent> <Leader>bjo :call <SID>jump_till_next_buffer() <BAR>silent! bd#<CR>
function! s:jump_till_next_buffer() abort
let current_nr=bufnr('%')
let max=100
while bufnr('%') == current_nr
  exec "normal \<C-O>"
  if max == 0
    echo 'max jumps reached!'
    break
  endif
  let max -= 1
endwhile
endfunction


" Windows {{{1
" ------------------------------------------------------------------------------

" Typical Buffers/Windows/Tabs operations
"   Note: Do not create other mappings starting with 'w' or 'q', lest VIM will
"   be forced to wait to see in another key is pressed after these keys, which
"   introduces a lag that is bothersome for these frequently used mappings.
nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>c :close<CR>
nnoremap <Leader>W :wall<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>x :quit!<CR>
nnoremap <Leader>X :qall!<CR>

" (Deprecated. Convenient, but marginal gain and conflicts with mappings).
" Use Ctrl+ to move between windows easily
"   Warning: Overwrites default mappings!
"     Default CTRL-J simply moves down (like 'j')
"     Default CTRL-K is used in command mode to enter di-graphs
"     Default CTRL-L redraws screen (almost never needed; use :redraw instead)
"     Default CTRL-H is <BS>. Still available in insert/command mode.
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Use 'Alt'+L to redraw screen (necessary as Ctrl-L was mapped above)
" nnoremap <M-l> :redraw<CR>

" Windows resizing
if has('nvim')
  " Neovim properly maps <M> to <Alt> key.
  nnoremap <M-,> <C-W><
  nnoremap <M-.> <C-W>>
  nnoremap <M-=> <C-W>+
  nnoremap <M--> <C-W>-
else
  " Vim does not properly map <Alt> key, so map codes obtained via <Ctrl-V>
  nnoremap , <C-W>>
  nnoremap . <C-W><
  nnoremap = <C-W>+
  nnoremap - <C-W>-
endif

" Tabs {{{1
" ------------------------------------------------------------------------------

" Moving between tabs
"   Warning: Overwrites default mappings!
"     Default 'unimpaired' mapping navigates between TAGS
"   [t  : tabprevious
"   ]t  : tabnext
"   [T  : tabfirst
"   ]T  : tablast
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>

" Creating, cLosing tabs
"   tn  : Tab New
"   td  : Tab Only
"   tc  : Tab Close
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tc :tabclose<CR>



" Fast Jumps (Into, out of, etc.) {{{1
" ------------------------------------------------------------------------------

" List (use middle row of TrulyErgonomic keyboard for common jumps)
"   <Del> : Jump to FZF tab list
"   <Tab> : Jump to FZF buffer list
"   <BS>  : Jump to alternate buffer
nnoremap <silent> <Leader><Tab> :Buffers<CR>
nnoremap          <Leader><Del> :tabs<CR>
nnoremap          <Leader><BS>  :b #<CR>

" Available targets
"   b    : buffers (with FZF)
"   t    : tabs (with FZF)
"   q    : quickfix window
"   l    : location list window

" Into
nnoremap <silent> <Leader>ib :Buffers<CR>
nnoremap          <Leader>iq :copen<CR>
nnoremap          <Leader>il :lopen<CR>
" Into
nnoremap          <Leader>oq :cclose<CR>
nnoremap          <Leader>ol :lclose<CR>
" Dock
nnoremap          <Leader>dl :lopen<CR>:wincmd L<CR>
nnoremap          <Leader>dq :copen<CR>:wincmd L<CR>




" Cursor movement {{{1
" ------------------------------------------------------------------------------

" All modes {{{2

if has('nvim')
  " Neovim properly maps <M> to <Alt> key.

  " Faster movement up/down with Alt
  noremap <M-j> 5gj
  noremap <M-k> 5gk
  " Faster movement left/right with Alt
  noremap <M-h> 10h
  noremap <M-l> 10l

else
  " Vim does not properly map <Alt> key, so map codes obtained via <Ctrl-V>

  " Faster movement up/down with Alt
  noremap j 5gj
  noremap k 5gk
  " Faster movement left/right with Alt
  noremap h 10h
  noremap l 10l

endif

" Move through wrapped lines as default, with reverse mappings
"   Warning: Overwrites default mappings!
"     Default is to navigate OVER wrapped lines
noremap k gk
noremap j gj
" Restore gk, gj via old k, j (i.e. swap!)"
noremap gk k
noremap gj j

" Half-page scrolling with Alt+Ctrl+J/K
" nnoremap <M-C-J> <C-D>
" nnoremap <M-C-K> <C-U>

" Center screen after common jumps.
"   Warning: Can be confusing if not used to it!
"   zj : Jump down to start of next fold
"   zk : Jump up to end of previus fold
"   ]] : Jump down to next '{' in first col
"   [[ : Jump up to previous '{' in first col
"   ][ : Jump down to next '}' in first col
"   [] : Jump up to previous '}' in first col
" noremap } }zz
" noremap { {zz
noremap zj zjzz
noremap zk zkzz
noremap ]]  ]]zz
noremap [[  [[zz
noremap []  []zz
noremap ][  ][zz
noremap `. `.zOzz

" Navigate to next/previous function (unimpaired style)
"   Warning: Overwrites default mapping!
"     Default 'unimpaired' mapping goes to next/previous file in
"     folder, so we'll restore the original by using the uppercase F
noremap [f []%0
noremap ]f ][][%0
nmap ]F <Plug>unimpairedDirectoryNext
nmap [F <Plug>unimpairedDirectoryPrevious

" Make S-RIGHT move to END of word
"   Warning: Overwrites default mapping! 
"     Defaults is the same as 'w', that is, move to start of next word.
noremap <S-Right> e

" }}}2

" Normal mode {{{2

" Faster scrolling with <C-E>/<C-Y>
"   Warning: Overwrites default mappings!
"     Default mappings do the same thing, only line-by-line.
nnoremap <C-E> 2<C-E>
nnoremap <C-Y> 2<C-Y>

" }}}2

" Command mode {{{2

" Built-in command-line editing mappings:
"   <C-B> : Beginning of line
"   <C-E> : End of line : Same as Bash
"   <C-H> : Delete char left of cursor (i.e. Backspace) : Same as Bash
"   <C-W> : Delete word before cursor : Same as Bash
"   <C-U> : Delete to beginning of line : Same as Bash
"   <C-M> : <CR> : Same as Bash
"   <C-[> : <Esc> : Same as Bash
"   <C-D> : Command-line completion
"   <C-F> : Open command-line window

" Additional mappings to make command line behave like Bash
"   Warning: Overrides default mapping
"   <C-A> : Beginning of line
"     Default CTRL-A is used to add count
"   <C-K> : Delete to end of line (https://superuser.com/a/855997)
"     Default CTRL-K is used to enter di-graphs
"   <M-f> : Move forward one word
"   <M-b> : Move backward one word
cnoremap <C-A> <Home>
cnoremap <C-K> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
if has('nvim')
  cnoremap <M-f> <S-Right>
  cnoremap <M-b> <S-Left>
else
  cnoremap f <S-Right>
  cnoremap b <S-Left>
endif

" Custom (movement without taking our hand of the home row!)
if has('nvim')
  cnoremap <M-j> <Down>
  cnoremap <M-k> <Up>
  cnoremap <M-h> <Left>
  cnoremap <M-l> <Right>
  cnoremap <S-M-h> <S-Left>
  cnoremap <S-M-l> <S-Right>
else
  cnoremap j <Down>
  cnoremap k <Up>
  cnoremap h <Left>
  cnoremap l <Right>
  cnoremap H <S-Left>
  cnoremap L <S-Right>
endif

" }}}2

" Insert mode {{{2

" Single char movement
"   Alt-h : Move one char left
"   Alt-j : Move one char down
"   Alt-k : Move one char up
"   Alt-l : Move one char right
if has('nvim')
  inoremap <M-h> <C-O>h
  inoremap <M-j> <C-O>j
  inoremap <M-k> <C-O>k
  inoremap <M-l> <C-O>l
  inoremap <S-M-h> <S-Left>
  inoremap <S-M-l> <S-Right>
else
  inoremap h <C-O>h
  inoremap j <C-O>j
  inoremap k <C-O>k
  inoremap l <C-O>l
  inoremap H <S-Left>
  inoremap L <S-Right>
endif

" Word movement
" inoremap <C-H> <C-O>b
" inoremap <C-L> <C-O>w

" }}}2


" Editing {{{1
" ------------------------------------------------------------------------------

" Exit insert mode with 'jf' or 'jk'.
"   The sequence 'jf' does not occur naturally.
"   The sequence 'jk' doesn't either, but has the advantage of leaving you in
"   the same position if you accidentally used while in normal mode.
inoremap jk <Esc>

" Make capital U perform a Redo
"   Warning: Overwrites default mappings!
"     Default is to undo whole line
nnoremap <S-U> <C-R>

" Preserve visual selection when changing indent
xnoremap <  <gv
xnoremap >  >gv

" Map Del/BS to what you would expect in Windows
" nnoremap <Del> dl
nnoremap <BS> dh
" Ctrl-Del
nnoremap <C-Del> dw
inoremap <expr> <C-Del> col(".") == col("$") ? "<Del>" : "<C-O>dw"
" Ctrl-Backspace
nnoremap <C-BS> mzgEld`zh
inoremap <C-BS> <C-O>:normal mzgEld`z<CR>
inoremap  <C-O>:normal mzgEld`z<CR>




" Indentation, Tabs, EOLs {{{1
" ------------------------------------------------------------------------------

" Tabs/Indentation
"   T2 : Tab to 2 spaces (change Tab characters to 4 spaces)
"   T4 : Tab to 4 spaces (change Tab characters to 4 spaces)
"   I2 : Indent w 2 spaces (set indent related settings to 2 spaces)
"   I4 : Indent w 4 spaces (set indent related settings to 4 spaces)
command! T22S %s/\t/  /eg
command! T24S %s/\t/    /eg
command! I2 set ts=2 sts=2 sw=2 et
command! I4 set ts=4 sts=4 sw=4 et

" Remove trailing spaces (and go back to starting place)
function! <SID>StringTrailingSpaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Fix spaces/EOLs
"   RTS : Remove Trailing Spaces
"   FE  : Fix End of lines (EOLS)
" command! RTS %s/\s\+$//g
command! RTS call <SID>StringTrailingSpaces()
command! FE %s/\n\n/\r/g



" Formatting {{{1
" ------------------------------------------------------------------------------

" Format around current paragraph
nnoremap Q  gqap

" Formatting
"   FJ : Format JSON (using python tool)
"   PD : Prettier Diff (current buffer vs what Prettier would produce)
command! FJ %!python -m json.tool
command! PD vnew | exe "read ! npx prettier" expand("#") | 0 delete | set syntax=javascript | windo diffthis



" Search/Substitute {{{1
" ------------------------------------------------------------------------------

" Search helpers (forward)
"   // : Start search with word delimiters prepopulated
"   /w : Execute search with current (escaped) word
"   /W : Execute search with current (escaped) WORD
"   *  : Same as standard '*', but with current (escaped) WORD
nnoremap <Leader>// /\<\><Left><Left>
nnoremap <Leader>/w "zyiw/<C-R>=escape(@z,'/')<CR><CR>
nnoremap <Leader>/W "zyiW/<C-R>=escape(@z,'/')<CR><CR>
nnoremap <Leader>/b "zyiw/\<<C-R>=escape(@z,'/')<CR>\><CR>
nnoremap <Leader>/B "zyiW/\<<C-R>=escape(@z,'/')<CR>\><CR>
nnoremap <Leader>* "zyiW/\<<C-R>=escape(@z,'/')<CR>\><CR>
" Visual
"   /  : Start search with current (escaped) selection prepopulated
"   *  : Execute search with current (escaped) selection
vnoremap <Leader>/ "zy/\<<C-R>=escape(@z,'/')<CR>\><Left><Left>
vnoremap <Leader>* "zy/\<<C-R>=escape(@z,'/')<CR>\><CR>

" Search helpers (forward)
"   ?  : Start search with word delimiters already populated
"   ?w : Execute search with current (escaped) word
"   ?W : Execute search with current (escaped) WORD
"   #  : Same as standard '#', but with current (escaped) WORD
nnoremap <Leader>? ?\<\><Left><Left>
nnoremap <Leader>?w "zyiw?<C-R>=escape(@z,'/')<CR><CR>
nnoremap <Leader>?W "zyiW?<C-R>=escape(@z,'/')<CR><CR>
nnoremap <Leader>?b "zyiw?\<<C-R>=escape(@z,'/')<CR>\><CR>
nnoremap <Leader>? "zyiW?\<<C-R>=escape(@z,'/')<CR>\><CR>
nnoremap <Leader># "zyiW?\<<C-R>=escape(@z,'/')<CR>\><CR>
" Visual
"   ?  : Start search with current (escaped) selection prepopulated
"   #  : Execute search with current (escaped) selection
vnoremap <Leader>? "zy?\<<C-R>=escape(@z,'/')<CR>\><Left><Left>
vnoremap <Leader># "zy?\<<C-R>=escape(@z,'/')<CR>\><CR>

" Quick change current word / selection
"   The word is placed in the current search pattern, which means that the
"   standard 'n' key can be used to navigate to the next match, and the standard
"   '.' key can be used to repeat the last change. Sweet!
"
"   c*  : Replace current word and start search forward (with word boundaries)
"   cg* : Same as c*, but without word boundaries in search pattern
"   c#  : Replace current word and start search backward (with word boundaries)
"   cg# : Same as c#, but without word boundaries in search pattern
nnoremap c* "zyiw/\<<C-R>=escape(@z,'/')<CR>\><CR>Ncgn
nnoremap cg* "zyiw/<C-R>=escape(@z,'/')<CR><CR>Ncgn
nnoremap c# "zyiw?\<<C-R>=escape(@z,'/')<CR>\><CR>Ncgn
nnoremap cg# "zyiw?<C-R>=escape(@z,'/')<CR><CR>Ncgn
" Visual
"   Same as above, but operating on the current selection
vnoremap c* "zy/\<<C-R>=escape(@z,'/')<CR>\><CR>Ncgn
vnoremap cg* "zy/<C-R>=escape(@z,'/')<CR><CR>Ncgn
vnoremap c# "zy?\<<C-R>=escape(@z,'/')<CR>\><CR>Ncgn
vnoremap c# "zy?<C-R>=escape(@z,'/')<CR><CR>Ncgn

" Substitute helpers
"   s  : Start substitute command
"   ss : Start substitute command (with word delimiters already populated)
"   sw : Start substitute command (prepopulated to current word).
"   sW : Start substitute command (prepopulated to current WORD).
"   sw : Same as sw, but with word boundaries.
"   sW : Same as sw, but with word boundaries.
"   s  : (Visual) Start substitute command with current (escaped) selection.
nnoremap <Leader>s :%s///gce<Left><Left><Left><Left><Left>
nnoremap <Leader>ss :%s/\<\>//gce<Left><Left><Left><Left><Left><Left><Left>
nnoremap <Leader>sw "zyiw:%s/<C-R>=escape(@z,'/')<CR>//gce<Left><Left><Left><Left>
nnoremap <Leader>sW "zyiW:%s/<C-R>=escape(@z,'/')<CR>//gce<Left><Left><Left><Left>
nnoremap <Leader>sb "zyiw:%s/\<<C-R>=escape(@z,'/')<CR>\>//gce<Left><Left><Left><Left>
nnoremap <Leader>sB "zyiW:%s/\<<C-R>=escape(@z,'/')<CR>\>//gce<Left><Left><Left><Left>
" Visual
"   s  : Start substitue command with current (escaped) selection prepoluated
"   sb : Same as s, but with word boundaries
vnoremap <Leader>s "zy:%s/<C-R>=escape(@z,'/')<CR>//gce<Left><Left><Left><Left>
vnoremap <Leader>sb "zy:%s/\<<C-R>=escape(@z,'/')<CR>\>//gce<Left><Left><Left><Left><Left><Left>

" Substitutions
"   SAO : Space Around Operators
"   SAC : Space Around Commas
"   SUP : Sql UPpercase (for statement and keysords)
command! SAO %s/\v(\i|\))\zs([<>=*/+-])\ze(\i|\()/ \2 /gce
command! SAC %s/\v,(\s|\n)@!/, /gce
command! SUP %s/\v<(abort|alter|analyze|begin|checkpoint|close|cluster|comment|commit|constraints|copy|create|deallocate|declare|delete|discard|do|drop|end|execute|explain|fetch|grant|import|insert|label|listen|load|lock|move|notify|prepare|prepared|reassign|refresh|reindex|release|reset|revoke|rollback|savepoint|security|select|select|set|show|start|transaction|truncate|unlisten|update|vacuum|values|work|absolute|access|action|add|admin|after|aggregate|all|also|always|analyse|and|any|as|asc|assertion|assignment|asymmetric|at|attach|attribute|authorization|backward|before|between|binary|both|by|cache|call|called|cascade|cascaded|case|cast|catalog|chain|characteristics|check|class|coalesce|collate|collation|column|columns|comments|committed|concurrently|configuration|conflict|connection|constraint|content|continue|conversion|cost|cross|csv|current|current_catalog|current_date|current_role|current_schema|current_time|current_timestamp|current_user|cursor|cycle|data|database|day|dec|default|defaults|deferrable|deferred|definer|delimiter|delimiters|depends|desc|detach|dictionary|disable|distinct|document|domain|each|else|enable|encoding|encrypted|enum|escape|event|except|exclude|excluding|exclusive|exists|extension|external|extract|false|family|filter|first|float|following|for|force|foreign|forward|freeze|from|full|function|functions|generated|global|granted|greatest|group|grouping|groups|handler|having|header|hold|hour|identity|if|ilike|immediate|immutable|implicit|in|include|including|increment|index|indexes|inherit|inherits|initially|inline|inner|inout|input|insensitive|instead|intersect|into|invoker|is|isnull|isolation|join|key|language|large|last|lateral|leading|leakproof|least|left|level|like|limit|local|localtime|localtimestamp|location|locked|logged|mapping|match|materialized|maxvalue|method|minute|minvalue|mode|month|name|names|national|natural|nchar|new|next|no|none|not|nothing|notnull|nowait|null|nullif|nulls|object|of|off|offset|oids|old|on|only|operator|option|options|or|order|ordinality|others|out|outer|over|overlaps|overlay|overriding|owned|owner|parallel|parser|partial|partition|passing|password|placing|plans|policy|position|preceding|preserve|primary|prior|privileges|procedural|procedure|procedures|program|publication|quote|range|read|recheck|recursive|ref|references|referencing|relative|rename|repeatable|replace|replica|restart|restrict|returning|returns|right|role|rollup|routine|routines|row|rows|rule|schema|schemas|scroll|search|second|sequence|sequences|serializable|server|session|session_user|setof|sets|share|similar|simple|skip|snapshot|some|sql|stable|standalone|statement|statistics|stdin|stdout|storage|strict|strip|subscription|substring|symmetric|sysid|system|table|tables|tablesample|tablespace|temp|template|temporary|then|ties|to|trailing|transform|treat|trigger|trim|true|trusted|type|types|unbounded|uncommitted|unencrypted|union|unique|unknown|unlogged|until|user|using|valid|validate|validator|value|variadic|verbose|version|view|views|volatile|when|where|whitespace|window|with|within|without|wrapper|write|xmlattributes|xmlconcat|xmlelement|xmlexists|xmlforest|xmlnamespaces|xmlparse|xmlpi|xmlroot|xmlserialize|xmltable|year|yes)>/\U\1/gIce



" Cut/Copy/Paste {{{1
" ------------------------------------------------------------------------------

" SYSTEM cut/copy/paste
"
"   Note that for this to work you need to install win32yank.exe. Simply
"   download it from [here](https://github.com/equalsraf/win32yank/releases)
"   and place the executable in a PATH folder. "
if has('nvim')
  " Neovim detects the presence of win32yank.exe and automatically place the
  " system clipboard in the '*' register, as expected.

  " "   System Paste
  " nnoremap <Leader>p "*p
  " xnoremap <Leader>p "*p
  " nnoremap <Leader>P "*P
  " xnoremap <Leader>P "*P
  " "   System Delete (Cut)
  " nnoremap <Leader>d "*d
  " xnoremap <Leader>d "*d
  " nnoremap <Leader>D "*dd
  " "   System Yank (Copy)
  " nnoremap <Leader>y "*y
  " xnoremap <Leader>y "*y

  "   System Paste
  nnoremap <Leader>p "+p
  xnoremap <Leader>p "+p
  nnoremap <Leader>P "+P
  xnoremap <Leader>P "+P
  "   System Delete (Cut)
  nnoremap <Leader>d "+d
  xnoremap <Leader>d "+d
  nnoremap <Leader>D "+dd
  "   System Yank (Copy)
  nnoremap <Leader>y "+y
  xnoremap <Leader>y "+y
  nnoremap <Leader>Y "+yy
  nnoremap <Leader>Y "+yy

else

  " Vim does not handle system clipboard automatically, so we have to come
  " with manual workarounds.

  "   System Paste
  nnoremap <silent> <Leader>p "=system("win32yank.exe -o --lf")<C-M>p
  nnoremap <silent> <Leader>P "=system("win32yank.exe -o --lf")<C-M>P
  xnoremap <silent> <Leader>p "=system("win32yank.exe -o --lf")<C-M>p

  " Option 1: Transfer last register to system clipboard
  "   Any delete or yank operation will populate the "0" register in addition
  "   to the register that was being targetted. We can use this fact to
  "   transfer the last delete or yank operation to the system clipboard.
  "   This requires us to first delete or yank whatever we want, and then
  "   issue the 'transfer' command below.
  nnoremap <silent> <Leader>y :call system("win32yank.exe -i", getreg("0"))<CR>

  " Option 2: Attempt to emulate Neovim implementation above
  "   System Delete (Cut)
  " xnoremap <silent> <Leader>d d<CR> \| :call system("win32yank.exe -i", getreg("0"))<CR>
  " nnoremap <silent> <Leader>D dd<CR> \| :call system("win32yank.exe -i", getreg("0"))<CR>
  "   System Yank (Copy)
  " xnoremap <silent> <Leader>y y<CR> \| :call system("win32yank.exe -i", getreg("0"))<CR>
  " nnoremap <silent> <Leader>Y yy<CR> \| :call system("win32yank.exe -i", getreg("0"))<CR>

endif

" Yank current word (into register @y)
"   Use '6' as it is on top of the 'y' for yank
nnoremap <Leader>6 my"yyiw`y
" Paste, replacing current word (from register @y)
"   Use '0' as it is on top of the 'p' for paste
"   Use of the 'black hole' register, so that no existing registers are affected.
nnoremap <Leader>0 mp"_diw"yP`p

" Visually select (L)ast pasted text
nnoremap <expr> <Leader>L '`[' . strpart(getregtype(), 0, 1) . '`]'

" Copy current buffer path to system clipboard
"   Use '%' as it normally represents the current buffer
if has('nvim')
  nnoremap <silent> <Leader>% :let @* = expand("%:p")<CR>:echom "let @*=" . expand("%:p")<CR>
else
  nnoremap <silent> <Leader>% :let @p = expand("%:p")<CR>:call system("win32yank.exe -i", getreg("p"))<CR>
endif



" Misc {{{1
" ------------------------------------------------------------------------------

" Function Keys
"   F1 : (Reserved)
"   F2 : Toggle paste/no paste
"   F3 : Yank (line) accummulator (using register @Z)
"   F4 : Toggle case
"
"   F5 : Run command 'q' (most common macro name)
"   F6 : Run command 'w' (second most common macro name)
"   F7 : Run command 'e' (third most common macro name).
"   F8 : Repeat last command
"
"   F9 : Insert date
"        See http://man7.org/linux/man-pages/man1/date.1.html for formatting options
"  F10 : Run current line in VIM
"  F11 : Run current line in shell
"  F12 : Run current line in shell and read the results
"
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> "Zyy
nnoremap <F4> mzg~iw`z
inoremap <F4> _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>
"
nnoremap <F5> @q
nnoremap <F6> @w
nnoremap <F7> @e
nnoremap <F8> @@
"
nnoremap <F9> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
inoremap <F9> <C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <F10> :<C-R><C-L><CR>
nnoremap <F11> :exec '!'.getline('.')<CR>
nnoremap <F12> :exec 'read !'.getline('.')<CR>

" Register web browser
"   This allows us to open any link with the built-in "gx" normal command,
"   provided by the built-in "netrw-gx". You will need to ensure that the
"   browser is found in the PATH.
let g:netrw_browsex_viewer="chrome"

" Quick method to remove search highlighting, for consistency with VSCode VIM
nnoremap <Leader>h :nohl<CR>
xnoremap <Leader>h :nohl<CR>

" Select the entire buffer (similar to Ctrl+A)
"   Before selecting, store current position in 'm' mark
nnoremap <Leader>a mmggVG
xnoremap <Leader>a mmggVG

" Reselect last change
"   Before selecting, store current position in 'm' mark
nnoremap <Leader>vv mm`[v`]

" Insert text
command! IE :normal O<C-O>0*   [<C-R>=strftime('%Y-%m-%d')<CR>]
command! ID :normal i<C-R>=strftime('%Y-%m-%d')<CR><Esc>

" Ctags (assummes it will be run at the project root)
command! T :! ctags -R00

" Edit Macro
"   https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>em  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Toggle syntax on/off
"   Mappings inspired by 'unimpaired' option toggling
"     [oS       - Option ON
"     ]oS       - Option OFF
"     yoS       - Toggle Option
"     <Leader>S - Toggle Option
nmap [oS       :syntax enable<CR>
nmap ]oS       :syntax off<CR>
nmap yoS       :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
nmap <Leader>S :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>

" Toggle colorcolumns
"   Mappings inspired by 'unimpaired' option toggling
"     [occ - Option ON
"     ]occ - Option OFF
"     yocc - Toggle Option
let s:colorcols="101"
nmap <expr> [occ ":set colorcolumn=".s:colorcols."<CR>"
nmap        ]occ :set colorcolumn=<CR>
nmap <expr> yocc ":set colorcolumn=".GetColorCols()."<CR>"
" nmap yocc :<C-R>=&colorcolumn == "80,100" ? "set colorcolumn=" : "set colorcolumn=80,100"<CR><CR>

func! GetColorCols()
  if &colorcolumn == s:colorcols
    return ""
  else
    return s:colorcols
  endif
endfunc

" Ascii mode
"   From https://www.reddit.com/r/vim/comments/1mkdhn/create_ascii_art_in_vim/
func! AsciiMode()
  syntax off
  setlocal virtualedit=all
  setlocal cc=80
  hi ColorColumn ctermbg=8 guibg=8
  autocmd BufWritePre * :%s/\s\+$//e
endfu
com! ASC call AsciiMode()

" Disable language providers that are not needed
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Wildmenu completion {{{2
" See https://github.com/ddrscott/config-nvim/blob/master/init.vim#L272
set wildmenu
set wildmode=list:longest,full
set wildignore=
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.bak,*.exe,target,tags,gem.tags
set wildignore+=*.pyc,*.DS_Store,*.db,*.min.js
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**
set wildignore+=*.js.map,ui/public/client/*,cassettes/**,node_modules/**
" }}}2



" Spelling, Thesaurus {{{1
" ------------------------------------------------------------------------------

" You can download thesaurus from:
"
"   Moby ()
"     Site: http://moby-thesaurus.org/
"     File: https://github.com/words/moby/blob/master/words.txt?raw=true
"   Project Gutenber
"     File: https://www.gutenberg.org/files/3202/files/mthesaur.txt
"
" These files can be placed anywhere, but by convention we'll place them in:
"
"   ~/.config/nvim/thesaurus/
"
set thesaurus+=~/.config/nvim/thesaurus/moby.txt



" Introspection {{{1
" ------------------------------------------------------------------------------

" Paths Info
"   PWF : Present Working File (show the full path of the current buffer).
"   CD  : Change Directory (to that of current file)
"   LCD : Local Change Directory (as above, but for local buffer only).
command! PWF echo expand('%:p')
command! CD cd %:p:h
command! LCD lcd %:p:h

" Paste VIM lists into a new buffer
command! Pmap redir @z | silent map | redir END | tabnew | put z
command! Pvmap redir @z | silent verbose map | redir END | tabnew | put z
command! Pmarks redir @z | silent marks | redir END | tabnew | put z
command! Preg redir @z | silent registers | redir END | tabnew | put z
command! Pdig redir @z | silent digraphs | redir END | tabnew | put z
command! Psyntax redir @z | silent syntax | redir END | tabnew | put z
command! Pscripts redir @z | silent scriptnames | redir END | tabnew | put z
command! Pvars redir @z | silent let | redir END | tabnew | put z
command! Pfunction redir @z | silent function | redir END | tabnew | put z
command! Pversion redir @z | silent version | redir END | tabnew | put z
command! Psetall redir @z | silent set all | redir END | tabnew | put z
command! Phi redir @z | silent verbose highlight | redir END | tabnew | put z
command! Pmessages redir @z | silent messages | redir END | tabnew | put z

" Output all highlight groups
"   See https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/#outputting-all-highlight-groups
command! Phitest :so $VIMRUNTIME/syntax/hitest.vim

" Show highlight groups
"   See https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/#showing-highlight-groups
command! Phishow call <SID>SynStack()
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



" Plugins {{{1
" ------------------------------------------------------------------------------

" netrw (built-in) {{{2
" ------------------------------------------------------------------------------

" Invocation
"   if : Into Files
nnoremap <Leader>if :Ex<CR>

" Tweaks for browsing
let g:netrw_liststyle=3     " Tree view
let g:netrw_preview=1       " Preview window shown in a vertical split
let g:netrw_alto=0          " Open horizontal splits below
let g:netrw_altv=1          " Open vertical splits to the right
let g:netrw_winsize=30      " Set windows to 30% of page
let g:netrw_banner=0        " Disable annoying banner
let g:netrw_browse_split=4  " Open in prior window

" Hide patterns
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'





" NERDTree {{{2
" ------------------------------------------------------------------------------
" https://vimawesome.com/plugin/nerdtree-red

" Settings
let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Mappings
"   tt : Tree Toggle
"        Open or close NERDTree
"   tf : Tree Focus
"        Focus on NERDTree window, or open if none.
"   tr : Tree Reveal
"        Reveal current file in NERDTree
"   ts : Tree Stay open
"        Ensure that NERDTree stays open when a file is opened from it.
"   tq : Tree Quit stay open
"        Ensure that NERDTree quits when a file is opened from it.
"   tg : Tree toGgle Stay open
"        Toggles Quit/Stay on open.
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tf :NERDTreeFocus<CR>
nnoremap <silent> <Leader>tr :NERDTreeFind<CR>
nnoremap <silent> <Leader>tq :call NERDTreeQuitOnOpen()<CR>
nnoremap <silent> <Leader>ts :call NERDTreeStayOnOpen()<CR>
nnoremap <silent> <Leader>tg :call NERDTreeQuitOnOpenToggle()<CR>

" Helpers
function! NERDTreeStayOnOpen()
  let g:NERDTreeQuitOnOpen=0
  echo "NERDTree will STAY on open."
endfunction
function! NERDTreeQuitOnOpen()
  let g:NERDTreeQuitOnOpen=1
  echo "NERDTree will QUIT on open."
endfunction
function! NERDTreeQuitOnOpenToggle()
  if g:NERDTreeQuitOnOpen
    let g:NERDTreeQuitOnOpen=0
    echo "NERDTree will STAY on open."
  else
    let g:NERDTreeQuitOnOpen=1
    echo "NERDTree will QUIT on open."
  endif
endfunction

" Alternate Mappings
"   it : Into Tree (Open NERDTree)
"   ot : Out of Tree (Close NERDTree)
nnoremap <silent> <Leader>it :NERDTree<CR>
nnoremap <silent> <Leader>ot :NERDTreeClose<CR>

" Mappings that operate only INSIDE the NERDTree window
"   h       : Same as 'x' (collapse tree to parent)
"   l       : Same as 'o' (open/close), but on the home row and as with 'nnn'.
"   L       : Same as 'O' (open/close recursively), but on the home row and as with 'nnn'.
"   <Tab>   : Preview file and move to one line DOWN
"   <C-Tab> : Preview file and move to one line UP
augroup filetype_nerdtree
  autocmd!
  autocmd FileType nerdtree nnoremap <buffer> h :call nerdtree#ui_glue#invokeKeyMap("x")<CR>
  autocmd FileType nerdtree nnoremap <buffer> l :call nerdtree#ui_glue#invokeKeyMap("o")<CR>
  autocmd FileType nerdtree nnoremap <buffer> L :call nerdtree#ui_glue#invokeKeyMap("O")<CR>
  autocmd FileType nerdtree nnoremap <buffer> <Tab> :call nerdtree#ui_glue#invokeKeyMap("go")<CR>j
  autocmd FileType nerdtree nnoremap <buffer> <S-Tab> :call nerdtree#ui_glue#invokeKeyMap("go")<CR>k
augroup END



" fzf {{{2
" -----------------------
" See https://github.com/junegunn/fzf.vim#commands

if executable('fzf')

  " Settings {{{
  "   See https://github.com/junegunn/fzf/blob/master/README-VIM.md#examples

  " An action can be a reference to a function that processes selected lines
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action={
    \ 'ctrl-v': 'vsplit',
    \ 'ctrl-x': 'split',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-q': function('s:build_quickfix_list')
    \ }

  " Default fzf layout
  "   down / up / left / right
  let g:fzf_layout={ 'down': '~40%' }

  " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
  "let g:fzf_layout={ 'window': 'enew' }
  "let g:fzf_layout={ 'window': '-tabnew' }
  "let g:fzf_layout={ 'window': '10new' }

  " Customize fzf colors to match your color scheme
  "   fzf#wrap translates this to a set of `--color` options
  let g:fzf_colors=
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1

  " Enable per-command history
  "   History files will be stored in the specified directory
  "   When set, CTRL-N and CTRL-P will be bound to 'next-history' and
  "     'previous-history' instead of 'down' and 'up'.
  "let g:fzf_history_dir='~/.local/share/fzf-history'

  " }}}

  " Standard {{{

  " Files
  "   ff  : All files (similar to :FZF)
  "   fh  : History of old files (v:oldfiles) and open buffers (i.e. History)
  "   fgf : GFiles   : Git Files (search all files tracked by Git)
  "   fgs : GFiles?  : Git Status (search all files that appear in a 'git status').
  nnoremap <silent> <Leader>ff :Files<CR>
  nnoremap <silent> <Leader>fh :History<CR>

  " Standard mappings/commands
  nnoremap <silent> <Leader>fb :Buffers<CR>
  nnoremap <silent> <Leader>fw :Windows<CR>
  nnoremap <silent> <Leader>fL :Lines<CR>
  nnoremap <silent> <Leader>fl :BLines<CR>
  nnoremap <silent> <Leader>fm :Marks<CR>
  nnoremap <silent> <Leader>ft :Tags<CR>
  nnoremap <silent> <Leader>fc :Commands<CR>

  " History mappings/commands
  "   fch : History Command (i.e. History:)
  "   fsh : History Search (i.e. History/)
  nnoremap <silent> <Leader>fch :History:<CR>
  nnoremap <silent> <Leader>fsh :History/<CR>

  " 'Maps' mappings
  "   Note: Originally mapped to <Leader>Tab
  nmap <Leader>M <Plug>(fzf-maps-n)^\
  nmap <Leader>m <Plug>(fzf-maps-n)
  xmap <Leader>m <Plug>(fzf-maps-x)
  omap <Leader>m <Plug>(fzf-maps-o)

  " Override Colors command
  "   You can safely do this in your .vimrc as fzf.vim will not override existing commands.
  command! -bang Colors
    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

  " }}}

  " Git {{{

  " Files
  "   gf  : GFiles   : Git Files (search all files tracked by Git)
  "   gs  : GFiles?  : Git Status (search all files that appear in a 'git status').
  "   gl  : Commits  : Git Commits (i.e. Log)
  "   gbl : BCommits : Git Buffer commits (i.e. git log for current buffer)
  nnoremap <silent> <Leader>gf :GFiles<CR>
  nnoremap <silent> <Leader>gs :GFiles?<CR>
  nnoremap <silent> <Leader>gl :Commits<CR>
  nnoremap <silent> <Leader>gbl :BCommits<CR>

  " Override Git Grep command
  " - fzf#vim#grep(command, with_column, [options], [fullscreen])
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

  " }}}

  " Insert mode completion {{{
  "   Warning: Some of these OVERRIDE the default VIM insert mode mappings.
  "
  " VIM default:
  "
  "   CTRL-X CTRL-L : Whole line
  "   CTRL-X CTRL-N : keywords in the current file
  "   CTRL-X CTRL-K : keywords in 'dictionary'
  "   CTRL-X CTRL-T : keywords in 'thesaurus', thesaurus-style
  "   CTRL-X CTRL-I : keywords in the current and included file
  "   CTRL-X CTRL-] : tag
  "   CTRL-X CTRL-F : file name
  "   CTRL-X CTRL-D : definitions or macro
  "   CTRL-X CTRL-V : Vim command-line
  "   CTRL-X CTRL-U : User defined completion
  "   CTRL-X CTRL-O : omni completion
  "   CTRL-X s      : Spelling suggestion
  "   CTRL-P        : keywords in 'complete appearing 'before'
  "   CTRL-N        : keywords in 'complete appearing 'next'
  "
  " FZF complements (work with same keys, but starting with <C-F>):
  "
  "   CTRL-F CTRL-L   :   Whole lines
  "   CTRL-F CTRL-B   :   Whole lines (from buffer only)
  "   CTRL-F CTRL-D   :   Words
  "   CTRL-F CTRL-F   :   File names
  "   CTRL-F CTRL-A   :   File names (via Ag)
  "   CTRL-F CTRL-P   :   Path
  "
  imap <C-F><C-L> <Plug>(fzf-complete-line)
  imap <C-F><C-B> <Plug>(fzf-complete-buffer-line)
  imap <C-F><C-D> <Plug>(fzf-complete-word)
  imap <C-F><C-F> <Plug>(fzf-complete-file)
  imap <C-F><C-A> <Plug>(fzf-complete-file-ag)
  imap <C-F><C-P> <Plug>(fzf-complete-path)

  " }}}

  " Rg (Ripgrep) {{{

  " nnoremap <silent> <Leader>frr :Rg
  nnoremap <silent> <Leader>fr :call SearchWordWithRg()<CR>
  vnoremap <silent> <Leader>fr :call SearchVisualSelectionWithRg()<CR>

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

  function! SearchWordWithRg()
    call fzf#vim#grep(
      \  "rg --column --line-number --no-heading --color=always --case-sensitive --word-regexp ".expand('<cword>'), 1)
  endfunction

  function! SearchVisualSelectionWithRg() range
    let old_reg=getreg('"')
    let old_regtype=getregtype('"')
    let old_clipboard=&clipboard
    set clipboard&
    normal! ""gvy
    let selection=getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Rg' selection
  endfunction

  " }}}

  " Ag (Silver Searcher) {{{

  " nnoremap <silent> <Leader>faa :Ag
  nnoremap <silent> <Leader>fa :call SearchWordWithAg()<CR>
  vnoremap <silent> <Leader>fa :call SearchVisualSelectionWithAg()<CR>

  function! SearchWordWithAg()
    call fzf#vim#grep(
      \  "ag --nogroup --column --color --case-sensitive --word-regexp ".expand('<cword>'), 1)
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg=getreg('"')
    let old_regtype=getregtype('"')
    let old_clipboard=&clipboard
    set clipboard&
    normal! ""gvy
    let selection=getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  " }}}

  " Search files {{{
  " See https://github.com/junegunn/fzf/blob/master/README-VIM.md#fzfrun

  function! SearchFiles(relPath)
    call fzf#vim#files(a:relPath, fzf#vim#with_preview())
  endfunction
  function! SearchFilesFd(relPath)
    call fzf#run(fzf#wrap({'source': 'fd . --no-ignore --hidden --type f ' . a:relPath . '/', 'options': [
      \ '--multi',
      \ '--preview-window', 'right:65%:hidden',
      \ '--preview', '/home/demia/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}'
      \ ]}))
  endfunction

  " Search files
  "   fda : FinD All
  "   fdw : FinD in nga Wip folder
  "   fds : FinD in nga Schema folder
  "   fdd : FinD in nga Data folder
  nnoremap <silent> <Leader>fda :call SearchFilesFd('.')<CR>
  nnoremap <silent> <Leader>fdw :call SearchFilesFd('wip')<CR>
  nnoremap <silent> <Leader>fds :call SearchFilesFd('packages/@db/schema')<CR>
  nnoremap <silent> <Leader>fdd :call SearchFilesFd('packages/@db/data')<CR>
  nnoremap <silent> <Leader>fdn :call SearchFilesFd('packages/@server')<CR>

  " }}}

endif



" fugitive {{{2
" ----------------------------

if 1 && s:isdev && !has('win32')

  " Auto-clean fugitive buffers
  augroup fugitive_init
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
  augroup END

  " Ensure refresh on commit
  let g:fugitive_replace_status_on_commit=1

  " Customize Gclog / Gllog
  "   The default format string is: "%h %P\t%H "
  "   The "g:fugitive_summary_format" string will be appended after that:
  let g:fugitive_summary_format="%cr | %an | %s"

  " Mappings
  "   G   : Same as :G (bring up Fugitive 'satus' window)
  "   gg  : Make Fugitive 'status' window the onone.
  "   gdc : Gdiffsplit Conflict (current file vs merge common ancestor)
  nnoremap <Leader>G :tabnew<CR>:G<CR>:on<CR>
  nnoremap <Leader>gg :execute bufwinnr('git/index')."wincmd w"<CR>:only<CR>
  nnoremap <Leader>gdc :Gdiffsplit HEAD...MERGE_HEAD<CR>

  " Add command to open diffsplit in a separate tab
  "   Use autocmd to add map ONLY on the fugitive window.
  "   The sequence of the mapping is:
  "     1. Do a normal Gdiffsplit (as 'dd' would do in the Fugitive 'status' window)
  "     2. Move to the Fugitive 'status' window ('git/index') using 'wincmd w'
  "     3. Move the 'git/index' window to a new tab using 'wincmd T'
  "     4. Move the 'git/index' tab to the one before the previous.
  "     5. Move to the next tab, which is where the Gdiffsplit will be.
  "   A bit convoluted, but better than hacking the internals of Fugitive! 
  augroup fugitive_difftab
    autocmd!
    autocmd FileType fugitive :nmap <silent> <buffer> dt :normal dd<CR>:execute bufwinnr('git/index')."wincmd w"<CR>:wincmd T<CR>:tabmove -1<CR>:tabNext<CR>
  augroup END

  " Add support for Learnlight bitbucket
  " (pending)
  "let g:fugitive_bitbucket_domains=['repo.learnlight.com/scm/ll']

endif



" node {{{2
" ----------------------------
" See https://vimawesome.com/plugin/node

if 0 && s:isdev && !has('win32') && exists('g:loaded_node')

  augroup fugitive_init
    autocmd!
    autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-W>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-W><C-F> <Plug>NodeVSplitGotoFile |
      \ endif
  augroup END

endif



" pgsql {{{2
" ----------------------------
" See https://vimawesome.com/plugin/pgsql

if 0 && s:isdev && !has('win32')

  " Enable for *.sql files (defaul is only for *.pgsql
  let g:sql_type_default='pgsql'

endif



" JsDoc {{{2
" ----------------------
" See https://vimawesome.com/plugin/vim-jsdoc

" <Leader> +
"   + : Insert JDoc
nnoremap <silent> <Leader>=jd <Plug>(jsdoc)



" SQL
augroup filetype_sql
  autocmd!

  " Options
  " autocmd FileType sql :setlocal nosplitright
  autocmd FileType sql :let b:vimpipe_filetype="sql"
  autocmd FileType sql :let g:vimpipe_silent=1
  " autocmd FileType sql :let g:vimpipe_split_command_options="+resize\\ 10"

  " Commands
  autocmd FileType sql :let b:vimpipe_command="psql postgres://nga_owner:gRF5UoClQ6hKUXPOo-3BrVxMjrRu6aVYsj4DIrsC@localhost:5432/nga"
	" autocmd FileType sql :let b:vimpipe_command="psql postgres://postgres:postgres@25.16.122.3:5432/ngadev"
  " autocmd FileType sql :let b:vimpipe_command="psql postgres://nga_login:W4i00n4KmRWUYmnnt_QDOg8L9Ab0HcMI2jfTaC3X@localhost:5432/nga"
augroup END

" Other types go here...



" tabular {{{2
" ----------------------
" See https://vimawesome.com/plugin/tabular

" Mappings
"   t  : Tabularize
"   tc : Tabularize Columns
"   ts : Tabularize 'AS'
"   td : Tabularize dashes (-)
vnoremap <Leader>t  :Tab /
vnoremap <Leader>tc :Tab /\v^ *\zs\w+\ze +<CR>
vnoremap <Leader>ta :Tab /\<AS\><CR>
vnoremap <Leader>td :Tab / - /l0<CR>



" vim-comentary {{{2
" ------------------------------------------------------------------------------
" See https://github.com/tpope/vim-commentary
if 1

  augroup filetype_vim_comentary
    autocmd!
    autocmd FileType json setlocal commentstring=//\ %s
  augroup END

endif



" Colorizer {{{2
" ------------------------------------------------------------------------------
" See https://vimawesome.com/plugin/colorizer

if 1

  " Mappings (inspired by 'unimpaired' option toggling)
  "   [oC - Option ON
  "   ]oC - Option OFF
  "   yoC - Toggle Option
  nmap [oC :ColorHighlight<CR>
  nmap ]oC :ColorClear<CR>
  nmap yoC :ColorToggle<CR>

  " Command
  command! CT :ColorToggle

endif



" Vim-math {{{2
" ------------------------------------------------------------------------------
" See https://vimawesome.com/plugin/vim-vmath

if 1

    vmap <expr> ++  VMATH_YankAndAnalyse()
    nmap        ++  vip++

endif



" lightline {{{2
" ------------------------------------------------------------------------------
" See https://vimawesome.com/plugin/lightline-vim
" See https://github.com/itchyny/lightline.vim
" See http://newbilityvery.github.io/2017/08/04/switch-to-lightline/

if 1

  " Lightline (below)
  set noshowmode " Don't show status line as 'lightline' already does it
  let g:lightline={}
  " let g:lightline.colorscheme = 'onehalfdark'
  let g:lightline.colorscheme = 'powerline'
  let g:lightline.active = { 'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'readonly', 'filename', 'modified' ] ] }
  let g:lightline.component_function = { 'cocstatus': 'coc#status' }
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }

  " Tabline (above)
  set showtabline=2 " Show tabline
  set guioptions-=e " Don't use GUI tabline
  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  " let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  " let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

  " Use autocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

endif



" FileType AutoCommands {{{1
" ------------------------------------------------------------------------------

" VIM help
" Tab/Shift+Tab go to next/previous tag
augroup filetype_help
  autocmd!
  autocmd FileType help :nnoremap <silent> <buffer> <Tab> /\('\zs\k\+'\\|[<Bar>]\zs\k\+[<Bar>]\)<CR>:set nohlsearch<CR>
  autocmd FileType help :nnoremap <silent> <buffer> <S-Tab> ?\('\zs\k\+'\\|[<Bar>]\zs\k\+[<Bar>]\)<CR>:set nohlsearch<CR>
augroup END

" javascript
" Configure indentation/tabs to 2 spaces
augroup filetype_javascript
  autocmd!
  autocmd FileType javascript :set ts=2 sts=2 sw=2 et
  autocmd BufWritePre *.js :call <SID>StringTrailingSpaces()
augroup END

" typescript
" Configure indentation/tabs to 2 spaces
augroup filetype_typescript
  autocmd!
  autocmd FileType typescript :set ts=2 sts=2 sw=2 et
  autocmd BufWritePre *.ts :call <SID>StringTrailingSpaces()
augroup END

" sh
" Configure indentation/tabs to 2 spaces
augroup filetype_sh
  autocmd!
  autocmd FileType sh :set ts=2 sts=2 sw=2 et
  autocmd BufWritePre *.sh :call <SID>StringTrailingSpaces()
augroup END

" sql
" Configure indentation/tabs to 4 spaces
augroup filetype_sql
  autocmd!
  autocmd FileType sql :set ts=4 sts=4 sw=4 et
  autocmd BufWritePre *.sql :call <SID>StringTrailingSpaces() | %s/\t/    /eg
augroup END

" .tmux.conf.local
augroup filetype_tmux
  autocmd!
  autocmd FileType tmux :set ts=2 sts=2 sw=2 et
  autocmd BufNewFile,BufRead .tmux.conf.local set filetype=tmux
augroup END

" gnuplot
" Configure indentation/tabs to 2 spaces
augroup filetype_gnuplot
  autocmd!
  autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
  autocmd FileType gnuplot :set ts=2 sts=2 sw=2 et
  autocmd BufWritePre *.gp :call <SID>StringTrailingSpaces()
augroup END

" Formatters
augroup formatters
  au FileType javascript setlocal formatprg=prettier
  au FileType javascript.jsx setlocal formatprg=prettier
  au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
  au FileType html setlocal formatprg=js-beautify\ --type\ html
  au FileType scss setlocal formatprg=prettier\ --parser\ css
  au FileType css setlocal formatprg=prettier\ --parser\ css
augroup END



" Files/Directories {{{1
" ------------------------------------------------------------------------------

" Change directory
nnoremap <Leader>cdb :cd ~/nga/packages/@builder/<CR>

" Open files
nnoremap <Leader>ep :tabnew ~/nga/package.json<CR>
nnoremap <Leader>es :tabnew ~/nga/packages/@db/schema/00-schema/specs.md<CR>


" }}
