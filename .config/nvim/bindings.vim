"------------------------------------------------------------------------
" SpellCheck
"------------------------------------------------------------------------
map <F2> :set spell!<CR>

inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
map <leader>[ :bp<CR>
map <leader>] :bn<CR>
map <leader>j o<esc>
map <leader>k O<esc>

"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
