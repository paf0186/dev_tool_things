set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" Neovim specific settings
if has('nvim')
    " Enable true color support
    set termguicolors
    " Better terminal mode escape
    tnoremap <Esc> <C-\><C-n>
endif
" Initialize our custom colorscheme
lua require('colorscheme').setup()
