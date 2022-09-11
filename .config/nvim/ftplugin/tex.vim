"------------------------------------------------------------------------------------------------------------------------------------------"
"								LaTeX Document
"------------------------------------------------------------------------------------------------------------------------------------------"

"------------------------------------------------------------------------
" <F9> for compiling the code
"------------------------------------------------------------------------

function! Synctex()
  let filename=bufname("%")
  let filenamePDF=filename[:-4]."pdf"
  exec "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . filename . " " . filenamePDF 
  redraw!
endfunction
map <C-z> :call Synctex()<cr>

nnoremap <buffer> <F9> :w<CR>:exec '!pdflatex ' shellescape(@%, 1)<CR>

noremap <leader>pre :-1read $HOME/docs/tmps/present.tex<CR>
noremap <leader>book :-1read $HOME/docs/tmps/book.tex<CR>
noremap <leader><Space> <Esc>/<++><Enter>"_c4l
" LaTeX Biblography
