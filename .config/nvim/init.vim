packadd! dracula
colorscheme dracula
set noshowmode
set number relativenumber
set mouse=a
set smartindent
syntax enable

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
call plug#end()

" VimWiki
let g:vimwiki_list = [{'path': '$HOME/Activities/naonao/wiki',
			\ 'template_path': '/home/yoda/Activities/naonao/templates/',
			\ 'template_ext': '.html',
			\ 'template_default': 'default',
			\ 'css_name': 'style.css'}]

" LightLine
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <A-n> :NERDTree<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-f> :NERDTreeFind<CR>
"
"autocmd VimEnter * NERDTree | wincmd p

" IPython
" map <F5> to save and run script
nnoremap <F5> :w<CR>:IPythonCellRun<CR>
inoremap <F5> <C-o>:w<CR><C-o>:IPythonCellRun<CR>

" map <F6> to evaluate current cell without saving
nnoremap <F6> :IPythonCellExecuteCell<CR>
inoremap <F6> <C-o>:IPythonCellExecuteCell<CR>

" map <F7> to evaluate current cell and jump to next cell without saving
nnoremap <F7> :IPythonCellExecuteCellJump<CR>
inoremap <F7> <C-o>:IPythonCellExecuteCellJump<CR>

" <F9> for running the code of c python latex
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -o a.out '.shellescape('%') '&& a.out' shellescape(@%, 1)<CR>
autocmd FileType rust nnoremap <buffer> <F9> :w <bar> exec '!rustc -o a.out '.shellescape('%') '&& a.out' shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <buffer> <F9> :w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>
autocmd FileType html nnoremap <buffer> <F9> :w<CR>:exec '!firefox' shellescape(@%, 1)<CR>
set laststatus=2

" LaTeX Document
inoremap <A-Space> <Esc>/<++><Enter>"_c4l
" LaTeX Biblography
