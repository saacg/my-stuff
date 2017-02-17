inoremap jk <ESC>
filetype plugin indent on
" syntax on
set encoding=utf-8
set clipboard=unnamedplus

" set up for python - taken from https://www.fullstackpython.com/vim.html

" enable syntax highlighting 
syntax enable

" show line numbers
" set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" shift lines by 4 spaces when using << or >>
set shiftwidth=4

" show a visual line under the cursor's current line
"set cursorline

" show matching parts of pairs for [] {} and ()
set showmatch

" enable all python highlighting features
let python_highlight_all = 1

" saw this function at vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
	autocmd FileType java setlocal noexpandtab
	autocmd FileType java setlocal list
	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
	autocmd FileType php setlocal expandtab
	autocmd FileType php setlocal list
	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
	autocmd FileType ruby setlocal tabstop=2
	autocmd FileType ruby setlocal shiftwidth=2
	autocmd FileType ruby setlocal softtabstop=2
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

