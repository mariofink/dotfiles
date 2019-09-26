" VIM Configuration - Vincent Jousse
" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible

filetype off              " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'posva/vim-vue'
Plugin 'chriskempson/base16-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set relativenumber        " Display line numbers relative to the current line
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor (for scrolling)

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set nohlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Enable syntax highlighting
syntax enable

" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Indentation settings
set expandtab
set shiftwidth=2
set softtabstop=2
set ai "Auto indent
set si "Smart indent

colorscheme base16-tomorrow-night

set guifont=Source\ Code\ Pro\ for\ Powerline:h16
set antialias


" Make EditorConfig plugin work well with fugitive and over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" CtrlP settings
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|' " use straight lines for tab separators
set laststatus=2 " open statusline also on single panes

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set virtualedit=all

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"""
" MAPPINGS
"""
let mapleader = ","

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Remap VIM 0 to first non-blank character
map 0 ^

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Enter to insert a new line below
" http://superuser.com/questions/607163/inserting-a-blank-line-in-vim#607189
map <Enter> O<ESC>
" Custom mappings
" Auto-indent current buffer without losing cursor position
" (http://vi.stackexchange.com/questions/8389/how-can-you-indent-your-current-file-without-losing-your-cursor-position#8392)
nnoremap <Leader>L maHmbgg=G`bzt`a<cr>
" Strip all trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" Use Ctrl-Tab and Ctrl-Shift-Tab to cycle through buffers
nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>
" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>
" Make `n`/`N` bring next search result to middle line
nnoremap n nzz
nnoremap N Nzz
" `vv` to highlight just the text (i.e. no indents) in a line
nnoremap vv ^vg_


