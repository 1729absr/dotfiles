"------------------------------------------------------------------------
" Using vim-plug to call the plugins
"------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

"------------------------------------------------------------------------
" NerdTree
"------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <A-n> :NERDTree<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-f> :NERDTreeFind<CR>
"autocmd VimEnter * NERDTree | wincmd p

"------------------------------------------------------------------------
" LightLine
"------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

"------------------------------------------------------------------------
" VimSlime
"------------------------------------------------------------------------
let g:slime_python_ipython = 1
let g:slime_target = "neovim"
