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

" Making tags includings sub-dir contents
command! MakeTags !ctags -R .

"------------------------------------------------------------------------
" This script contains general plugin specific settings
"------------------------------------------------------------------------
source ~/.config/nvim/plugins.vim
colorscheme PaperColor
set laststatus=2

"------------------------------------------------------------------------
" This script contains key-bindings
"------------------------------------------------------------------------
source ~/.config/nvim/bindings.vim
