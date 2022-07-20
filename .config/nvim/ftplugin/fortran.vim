"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType fortran nnoremap <buffer> <F9> :w<CR>:exec '!gfortran -o %:r' shellescape('%') '&& ./%:r' shellescape(@%, 1)<CR>
