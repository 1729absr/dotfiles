packadd! dracula
syntax enable
colorscheme dracula
set number
set mouse=a
set smartindent
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

" AirLine
let g:airline#extensions#tabline#enabled = 1

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <A-n> :NERDTree<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-f> :NERDTreeFind<CR>

"autocmd VimEnter * NERDTree | wincmd p

" <F9> for running the code of c python latex
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -o ~/a.out '.shellescape('%') '&& ~/a.out' shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <buffer> <F9> :w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
set laststatus=2
" LaTeX Document
inoremap <A-Space> <Esc>/<++><Enter>"_c4l
" LaTeX Biblography
