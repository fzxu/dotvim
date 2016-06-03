call pathogen#infect()

set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set nofoldenable

" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

colorscheme desert 
syntax on

set ruler 
set hlsearch
set autoread
filetype plugin on
filetype indent on

" nerdtree
let NERDTreeShowHidden=1
" default open nerdtree window
"au VimEnter *  NERDTree

" CtrlP
" https://github.com/kien/ctrlp.vim
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.class,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|idea|node_modules)$'

" Some mappings
map <D-r> :!$HOME/.rbenv/shims/ruby %<cr>
map <F8> :!$VIRTUAL_ENV/bin/python %<CR>

" statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

" syntastic
"set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = '$VIRTUAL_ENV/bin/python'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['go']
let g:go_list_type = "quickfix"
let g:syntastic_aggregate_errors = 1

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END

