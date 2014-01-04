call pathogen#infect()

set shiftwidth=4
set softtabstop=4

" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

colorscheme desert 
syntax on

set ruler 
set hlsearch

" CtrlP
" https://github.com/kien/ctrlp.vim
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.class,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|idea|node_modules)$'

autocmd FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt
