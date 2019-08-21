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
" => ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show suggestions automatically while in insert mode
autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')

" Comment highlighting in jsonc for coc configuration
autocmd FileType json syntax match Comment +\/\/.\+$+

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>f  <Plug>(coc-fix-current)

" use `:OR` for organize import of current buffer
nmap <leader>o :CocCommand java.action.organizeImports<CR>

" Make sure coc uses compiled code
let g:coc_force_debug = 1
