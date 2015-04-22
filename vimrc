call pathogen#infect()

set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

colorscheme desert 
syntax on

set ruler 
set hlsearch
set autoread
filetype plugin on

" CtrlP
" https://github.com/kien/ctrlp.vim
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.class,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|idea|node_modules)$'

" Some mappings
map <D-r> :!$HOME/.rbenv/shims/ruby %<cr>

autocmd FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END
