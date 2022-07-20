"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>

"------------------------------------------------------------------------
" IPython
"------------------------------------------------------------------------
" map <F5> to save and run script
nnoremap <F5> :w<CR>:IPythonCellRun<CR>
inoremap <F5> <C-o>:w<CR><C-o>:IPythonCellRun<CR>

" map <F6> to evaluate current cell without saving
nnoremap <F6> :IPythonCellExecuteCell<CR>
inoremap <F6> <C-o>:IPythonCellExecuteCell<CR>

" map <F7> to evaluate current cell and jump to next cell without saving
nnoremap <F7> :IPythonCellExecuteCellJump<CR>
inoremap <F7> <C-o>:IPythonCellExecuteCellJump<CR>
