"-----------------------------------------------------------------------------
" SETUP
"-----------------------------------------------------------------------------

"The super basic stuff:
set encoding=utf-8        "UTF8 All day, every day
set nocompatible          "Use vim settings, not vi settings. Affects a lot.

"-----------------------------------------------------------------------------
" GENERAL SETTINGS
"-----------------------------------------------------------------------------

"Basic stuff
filetype on               "Enable filetypes
filetype plugin on        "Enable filetype plugins
filetype indent on        "Enable filetype indent - loads indent.vim
syntax on                 "Enables syntax highlighting
set synmaxcol=600         "Don't try to highlight lines with 600+ columns
set history=100           "Sets how many lines of history VIM has to remember
set timeoutlen=500        "lowers leader+command timeout.
set hidden                "Switch between buffers without saving
set visualbell            "Use visual bell instead of beep add t_vb= to disable
set gdefault              "Apply substitutions globally on a line by default
set ttyfast               "Speed up terminal connection
" set clipboard=unnamed     "Give yank commands access to system clipboard
set nobackup              "Get rid of backups, I don't use them
set nowb                  "Get rid of backups on write
set noswapfile            "Get rid of swp files, I have never used them

"Changes leader from \ to space - REACHABLE BY BOTH HANDS, WAT?!
let mapleader = "\<space>"

"Map : to ; (then remap ;) -- massive pinky-saver
noremap ; :
noremap <M-;> ;

"Map escape key to jk -- much faster
inoremap jk <esc>

"More useful command-line completion
set wildmode=list:longest
set wildmenu

"In many terminal emulators the mouse works just fine, so have at it.
set mouse=a

"-----------------------------------------------------------------------------
" INTERFACE
"-----------------------------------------------------------------------------

set bg=dark
set title                 "Update the title of window or terminal
set autoread              "reload files when changed on disk
set linespace=2           "Slightly higher linespace
set relativenumber        "Relative numbers make for easy movement
set more                  "Adds the more prompt to long screen prints
set ruler                 "Cursor position in lower right
set showcmd               "Show command in bottom right
set showmode              "Shows current mode
set incsearch             "Set incremental searching
set hlsearch              "Highlight searching
set ignorecase            "case insensitive search
set smartcase             "case insensitive search
set mousehide             "hide mouse when typing
set foldenable            "Enable code folding
set foldmethod=marker     "Use {{{ and }}} to define folds
set splitbelow            "Split windows below the current window
set splitright            "Split vertical windows on the right
set lazyredraw            "Does not redraw while macro is running (faster)
set scrolloff=3           "Always keeps cursor three lines from bottom
set sidescrolloff=7       "Keeps 7 chars onscreen when nowrap set
set sidescroll=1          "Minimum number of columns to scroll sideways

"Shortcut to rapidly toggle `set list` (shows invisibles)
nmap <leader>L :set list!<CR>

"Use the similar symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬,trail:⋅

"Settings for diff mode
set diffopt=filler,vertical

"Allows splits to be squashed to one line
set winminheight=0
set winminwidth=0

"-----------------------------------------------------------------------------
" STATUS LINE
"-----------------------------------------------------------------------------

set laststatus=2          "Always show status line

"-----------------------------------------------------------------------------
" TEXT AND TAB SETTINGS
"-----------------------------------------------------------------------------

set tabstop=4              "Tab stuff
set shiftwidth=4
set softtabstop=4
set shiftround
set noexpandtab
set smartindent            "Indent stuff
set autoindent
set textwidth=80
set colorcolumn=+1         "Make it obvious where 80 chars is

"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Better line wrapping
set wrap
set linebreak
set textwidth=78
set formatoptions=qrn1
set showbreak=+\ 

"Toggle to different paste modes
nnoremap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap \R :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

"Toggle wrap mode
nnoremap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

"-----------------------------------------------------------------------------
" EXTRA COMMANDS AND EXTENDED FUNCTIONALITY
"-----------------------------------------------------------------------------

"Easier window navigation, control+letter moves in that direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"emacs style jump to end of line in insert mode
"prevents conflict with autocomplete
inoremap <expr> <c-e> pumvisible() ? "\<c-e>" : "\<c-o>A"
inoremap <C-a> <C-o>I

"Quickly select text you just pasted
noremap gV `[v`]

"Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

"Open line above (ctrl-shift-o much easier than ctrl-o shift-O)
"SO USEFUL!!!
inoremap <C-Enter> <C-o>o
inoremap <C-S-Enter> <C-o>O

"Map for removing search highlighting
nnoremap <silent> <leader><cr> :noh<cr>

"Will open files in current directory, allows you to leave the working cd in
"the project root. You can also use %% anywhere in the command line to expand.
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%

"Change current directory to that of the file in the buffer with CMD + D
nnoremap <silent> <D-d> :cd %:p:h<cr>

"Jump back to last edited buffer - SUPER USEFUL
nnoremap <D-b> <C-^>
inoremap <D-b> <esc><C-^>

"-------------------"
" FILETYPE SETTINGS
"-------------------"

if has("autocmd")
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au BufRead,BufNewFile *.txt,*.text set filetype=markdown
    au FileType css,scss,sass setlocal ts=2 sts=2 sw=2 iskeyword+=-
    au FileType markdown setlocal ts=2 sts=2 sw=2 noexpandtab spell
endif
