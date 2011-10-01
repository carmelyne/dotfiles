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

set encoding=utf-8
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set autoread
set expandtab
set showmatch
set showcmd
set showmode
set number
set ruler
set incsearch
set hlsearch
set title
set visualbell
set nobackup
set nowritebackup
set directory=$HOME/.vim/tmp//,.
set invlist
set backspace=indent,eol,start
set t_Co=256
set history=1000
set ignorecase
set smartcase
set ofu=syntaxcomplete#Complete

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
set grepprg=ack-grep
set grepformat=%f:%l:%m
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

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
