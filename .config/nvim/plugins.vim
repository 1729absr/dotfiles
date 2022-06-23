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
