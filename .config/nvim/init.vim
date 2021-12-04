packadd! dracula
syntax enable
colorscheme dracula
set number
set mouse=a
set smartindent
" <F9> for running the code of c python latex
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -o ~/a.out '.shellescape('%') '&& ~/a.out' shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <buffer> <F9> :w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
set laststatus=2
"let g:powerline_pycmd="py"
" LaTeX Document
inoremap <A-Space> <Esc>/<++><Enter>"_c4l
" LaTeX Biblography

