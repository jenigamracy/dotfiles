set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup and swap file dirs
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOOK AND FEEL

" Line numbers
set number
nnoremap <F2> :set number!<CR>

" Syntax highlighting
syntax enable

" Highlight if over 120 characters
highlight OverLength ctermbg=gray guibg=#FFD9D9
match OverLength /\%>120v.\+/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NAVIGATION

" Disable the arrow keys - yes, your partner will hate you
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Hit wrapped lines instead of skipping through them when traversing through a file
nnoremap j gj
nnoremap k gk

" Split movement
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-l> :wincmd l<cr>
nmap <silent> <C-k> :wincmd k<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACING
set tabstop=4       " tab = 4 spaces
set shiftwidth=4    " indentation = 4 spaces
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOUSE
   
" Enable the mouse 
set mouse=a     

" Toggle the mouse
nnoremap <F12> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
set incsearch   " Enable searching
set ignorecase  " Ignore case when searching...
set smartcase   " ... unless i use case in my searches
set infercase   " ... but not for tab complete
set hlsearch    " Highlight the search results and highlight *while* searching

" Use // instead of /ASDF!@#$ to clear your search
nmap <silent> // :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DIFFING

" Diff highlighting
highlight DiffAdd    cterm=none ctermfg=gray  ctermbg=darkblue
highlight DiffDelete cterm=none ctermfg=gray  ctermbg=cyan
highlight DiffChange cterm=none ctermfg=green ctermbg=black
highlight DiffText   cterm=none ctermfg=green ctermbg=darkblue

" zR to unfold
" zA to fold
if &diff                          " only for diff mode/vimdiff
    set diffopt=filler,context:10 " filler is default and inserts empty lines for sync
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER

" Reload vimrc without restarting vim
au BufWritePost .vimrc source %
