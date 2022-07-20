"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -o %:r '.shellescape('%') '&& ./%:r' shellescape(@%, 1)<CR>
