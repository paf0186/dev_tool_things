call plug#begin()
" Your plugins go here, for example:
Plug 'rhysd/vim-clang-format'
" Enhanced C syntax highlighting - better than default for kernel code
Plug 'vim-scripts/c.vim'

" Tag sidebar - shows function/struct overview
" Automatic ctags management
Plug 'ludovicchabant/vim-gutentags'

" Shows git diff markers in the gutter
Plug 'airblade/vim-gitgutter'

Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

call plug#end()

let mapleader=" "
" <leader>w to save
nnoremap <leader>w :w<CR>

" <leader>q to quit
nnoremap <leader>q :q<CR>

" <leader>n to disable/enable numbers on left side
nnoremap <leader>n :set number! relativenumber!<CR>

nnoremap <C-[> <C-t>

set number relativenumber
set ruler
let g:clang_format#detect_style_file = 1
let g:clang_format#enable_debug = 1

command! CSR execute '!cscope -Rb' | execute 'cs reset'

" Remove the gray background from the sign column (the gutter)
highlight clear SignColumn

" Set colors for git-gutter symbols
highlight GitGutterAdd    ctermfg=green  guifg=#00ff00
highlight GitGutterChange ctermfg=yellow guifg=#ffff00
highlight GitGutterDelete ctermfg=red    guifg=#ff0000

if has("cscope")
    " Use both cscope and ctag
    set cscopetag

    " Use cscope for ctrl-] (goto definition)
    set cscoperelative

    " Show msg when cscope db added
    set cscopeverbose

    " Search cscope first, then ctags
    set cscopetagorder=0

	" s: Find symbol (references)
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

	" g: Find definition
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>

	" c: Find functions calling this function
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

	" t: Find text string
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

	" e: Find egrep pattern
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>

	" f: Find file
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

	" i: Find files including this file
	nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

	" d: Find functions called by this function
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Codeium
imap <C-'>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-;>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-x>  <Cmd>call codeium#Clear()<CR>
" Set dark background for entire statusline
highlight StatusLine ctermbg=235 ctermfg=white guibg=#262626 guifg=white
highlight StatusLineNC ctermbg=235 ctermfg=white guibg=#262626 guifg=white
highlight User1 ctermbg=235 ctermfg=white guibg=#262626 guifg=white

" Define full statusline content with consistent coloring
set statusline=%1*
set statusline+=%f                               " File path
set statusline+=%m                               " Modified flag
set statusline+=%r                               " Readonly flag
set statusline+=%h                               " Help buffer flag
set statusline+=%w                               " Preview window flag
set statusline+=%=                               " Switch to right side
set statusline+=%3{codeium#GetStatusString()}    " Codeium status
set statusline+=%*                               " Reset highlighting
set laststatus=2
" Save file position
set viminfo='100,<1000,s100,h
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
