" Plugins
source ~/.config/nvim/plugins.vim

" Key-bindings
source ~/.config/nvim/bindings.vim

colorscheme codedark
set laststatus=2

set noshowmode
set number relativenumber
set mouse=a
set smartindent
set cursorline
syntax enable
filetype plugin on

" fzf search down into sub-dirs
set path+=**

" Display all the matching files when we tab complete
set wildmenu

" For going over far away
"set colorcolumn=81
"highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Synctex
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

" Making tags includings sub-dir contents
command! MakeTags !ctags -R .

