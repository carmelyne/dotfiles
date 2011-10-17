set nocompatible

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
 call pathogen#runtime_append_all_bundles()
 call pathogen#helptags()
endif

filetype off

syntax on

filetype plugin indent on

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Automatically append closing parenthesis
:inoremap ( ()<Esc>i

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set encoding=utf-8                " Enabling UTF-8 Support
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time
set smarttab                      " Uses shiftwidth instead of tabstop at start of lines
set autoindent                    " Does nothing more than copy the indentation from the previous line
set smartindent                   " Automatically inserts one extra level of indentation in some cases, and works for C-like files
set autoread                      " Automatically read the file again when it is changed outside of Vim
set expandtab                     " To insert space characters whenever the tab key is pressed
set showmatch                     " Highlights the matching braces|brackets|parenthesis when the cursor is on a bracket
set matchtime=3                   " Showmatch for 3 milliseconds
set magic                         " Allows pattern matching with special characters
set textwidth=79                  " Limit all lines to a maximum of 79 characters
set invlist                       " Invisible text is shown
set t_Co=256                      " To enable 256 colors
set history=1000                  " Keeps a thousand lines of history
set ofu=syntaxcomplete#Complete   " To turn on omnicompletion

" Additional Ruby Syntax Highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" RDOC Syntax Highlighting
autocmd BufRead,BufNewFile *.rd,*.rdoc     set filetype=rdoc

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Monaco:h18 guioptions-=T columns=120 lines=70 number
augroup END

" A really status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if &statusline == ''
  set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
end

" ACK integration
" set grepprg=ack-grep
" set grepformat=%f:%l:%m
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Find searched_string in directories(...)
function RailsGrep(searched_string,...)
  let s:dir_list = ''
  for dir in a:000
    let s:dir_list = s:dir_list . dir
  endfor
  execute "silent! grep --ruby " . a:searched_string . " " . s:dir_list
  botright cw
  redraw!
endfunction
" Find searched_string in all project(app and lib directories)
:command -nargs=+ Rgrep call RailsGrep('<q-args>',"app/ lib/ config/initializers vendor/plugins")
" Find  definition in the project(models,controllers,helpers and lib)
:command -nargs=1 Rgrepdef call RailsGrep("'def .*" . <q-args> . "'","app/models app/controllers app/helpers lib/ config/initializers ven    dor/plugins")

colorscheme railscasts

" Navigate between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()