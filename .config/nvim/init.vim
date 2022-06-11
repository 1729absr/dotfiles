set noshowmode
set number relativenumber
set mouse=a
set smartindent
syntax enable
filetype plugin on

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
