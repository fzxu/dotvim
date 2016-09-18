call pathogen#infect()

set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set nofoldenable

" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent on

colorscheme desert
syntax on

set ruler
set hlsearch
set autoread
filetype plugin on
filetype indent on

" set leader key
:let mapleader = "\\"

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
nmap <F8> :TagbarToggle<CR>

" statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'errcheck']

" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"

map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END
