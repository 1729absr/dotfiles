"------------------------------------------------------------------------
" SpellCheck
"------------------------------------------------------------------------
map <F2> :set spell!<CR>

"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -o a.out '.shellescape('%') '&& a.out' shellescape(@%, 1)<CR>
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>

function! Synctex()
        " remove 'silent' for debugging
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>
