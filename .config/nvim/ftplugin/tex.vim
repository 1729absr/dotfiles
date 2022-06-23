"------------------------------------------------------------------------------------------------------------------------------------------"
"								LaTeX Document
"------------------------------------------------------------------------------------------------------------------------------------------"

"------------------------------------------------------------------------
" <F9> for compiling the code
"------------------------------------------------------------------------

function! Synctex()
        " remove 'silent' for debugging
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>

autocmd FileType tex nnoremap <buffer> <F9> :w<CR>:exec '!pdflatex -synctex=1' shellescape(@%, 1)<CR>

inoremap <A-Space> <Esc>/<++><Enter>"_c4l
" LaTeX Biblography
