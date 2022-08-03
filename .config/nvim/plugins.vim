"------------------------------------------------------------------------
" Using vim-plug to call the plugins
"------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
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
" VimWiki
"------------------------------------------------------------------------
let g:vimwiki_list = [{'path': '$HOME/main/naonao/wiki',
			\ 'template_path': '/home/yoda/main/naonao/templates/',
			\ 'template_ext': '.html',
			\ 'template_default': 'default',
			\ 'css_name': 'style.css'}]
"let g:vimwiki_list = [{'path': '$HOME/main/naonao/content',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

"------------------------------------------------------------------------
" VimSlime
"------------------------------------------------------------------------
let g:slime_python_ipython = 1
