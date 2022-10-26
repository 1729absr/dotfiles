"------------------------------------------------------------------------
" Using vim-plug to call the plugins
"------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasiser/vim-code-dark'
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
let g:vimwiki_list = [{'path': '$HOME/main/web/absr/wiki',
			\ 'template_path': '~/main/web/absr/templates/',
			\ 'template_ext': '.html',
			\ 'template_default': 'default',
			\ 'css_path' : '~/main/web/absr/templates/',
			\ 'css_name': 'style.css'}]
"let g:vimwiki_list = [{'path': '$HOME/main/naonao/content',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

"------------------------------------------------------------------------
" VimSlime
"------------------------------------------------------------------------
let g:slime_python_ipython = 1
let g:slime_target = "neovim"
