syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set hlsearch
set hidden
set ruler
set wrap
set linebreak
set dir=/tmp//
set scrolloff=5
set ignorecase

" keyboard remaps, use the home row for dvorak editing commands:
" e - change
" u - insert
" i - substitute
noremap e c
noremap E C
noremap u i
noremap U I
noremap i s
noremap I S

" movement commands
" h - left
" t - down
" n - up
" s - right
noremap t j
noremap T J
noremap n k
noremap N K
noremap s l
noremap S L

" plugging holes in mapping
" l - undo
" c - end
" k - next
" j - until
noremap l u
noremap L U
noremap c e
noremap C E
noremap k n
noremap K N
noremap j t
noremap J T

" moving between vim panes
noremap <C-h> <C-w>h
noremap <C-t> <C-w>j
noremap <C-n> <C-w>k
noremap <C-n> <C-w>l

filetype plugin indent on

" define highlight schemes
highlight ExtraWhitespace ctermbg=darkred
highlight LineLengthError ctermbg=darkblue

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" autoremove trailing spaces when saving the buffer
autocmd BufWritePre <buffer> :%s/\s\+$//e

" highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" status line
set laststatus=2
set statusline=
set statusline+=%</                     " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\      " buffer number, flags
set statusline+=%-40f\                  " relative path
set statusline+=%=                      " separate left- and right-aligned
set statusline+=%1*%y%*%*\              " file type
set statusline+=%10(L(%l/%L)%)\         " line
set statusline+=%2(C(%v/125)%)\         " column
set statusline+=%P                      " percentage of file

" functions
function! Trim()
    %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()

" local overrides
" add machine-specific options from a ~/.vimrc_local
if filereadable(expand('~/.vimrc_local'))
    source ~/.vimrc_local
endif
