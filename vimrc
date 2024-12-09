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
call plug#end()

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
