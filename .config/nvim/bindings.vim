" SpellCheck
map <F2> :set spell!<CR>
" emacs binding to move to start or end of line in insert mode.
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
" move to prev or next buffer
noremap <leader>[ :bp<CR>
noremap <leader>] :bn<CR>
" adding line above or below the current
noremap 'j o<esc>
noremap 'k O<esc>
" <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>
" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"------------------------------------------------------------------------
" <F9> for running the code
"------------------------------------------------------------------------
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
