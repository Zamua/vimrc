"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized

set nu
set rnu
set path+=**;
set wildmenu
set wildignore=*.class
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set complete-=i
set scrolloff=5
set noautoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map T <C-W>T

nmap <CR> :nohlsearch<CR>
nnoremap <c-f> <C-W>gf

"Remove all trailing whitespace by pressing F4
nnoremap <F4> mm:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>`m

"Copy to system clipboard
vmap <C-c> "*y<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript map <leader>f :ALEFix<cr>
autocmd FileType typescript map <leader>f :ALEFix<cr>

let g:ale_completion_enabled = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['standard']
let g:ale_linters['typescript'] = ['eslint']
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['standard']
let g:ale_fixers['typescript'] = ['eslint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => eclim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
autocmd FileType java map <leader>i :JavaImportOrganize<cr>
autocmd FileType java map <leader>f :%JavaFormat<cr>
autocmd FileType java map <leader>d :JavaSearchContext<cr>
autocmd FileType java map <leader>c :JavaCorrect<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
