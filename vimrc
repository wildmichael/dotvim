call pathogen#infect()
call pathogen#helptags()

colorscheme delek

au!

filetype plugin indent on
filetype on " enable filetype detection

set nocompatible  " Use Vim defaults (much better!)
set backspace=2   " allow backspacing over everything in insert mode
set nohlsearch
set textwidth=0   " do not want lines to auto-wrap
syntax on
set diffopt+=iwhite
set nobackup writebackup " backup current file, deleted afterwards (default)
set viminfo='1000,\"10000 " 1000 files with marks, 10000 lines of registers
set history=1000   " keep 1000 lines of command line history
set ruler   " show the cursor position all the time
set number  " want to see line numbering
set tabpagemax=20
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" set colors
set t_Co=8
set t_Sb=^[4%dm
set t_Sf=^[3%dm

set autowrite

" use hjkl in insert mode as well (with ctrl)
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

set modeline
set modelines=5

" highlight trailing space as error and tabs in general
highlight TabCharacters ctermbg=LightGray guibg=LightGray
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match TabCharacters "\t" containedin=ALL
autocmd Syntax * syn match ExtraWhitespace excludenl "\s\+$" containedin=ALL
" highlight anything beyond column 80
match ErrorMsg '\%>79v.\+'

" no connection to the X-server
set clipboard=exclude:.*

" C++ completion
set tags+=~/.vim/tags/cpp

" build tags of your own project with CTRL+F12

map <C-F12> :!ctags-exuberant -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" taglist plugin
let Tlist_Ctags_Cmd = "ctags-exuberant"
nnoremap <silent> <F7> :TlistToggle<CR>

" W command to delete trailing white space and Dos-returns and to expand tabs
" to spaces.
nnoremap W :%s/[\r \t]\+$//e<CR>:RetabIndent!<CR>

" fortran indenting
let fortran_do_enddo=1

" C/C++ indenting (would like FileType c,cpp, but that kills OpenFOAM below)
autocmd BufRead *.c,*.cpp,*.cxx,*.cc,*.h,*.hpp,*.hxx,*.hh set cindent cinoptions=(0,g0,W2s,u0,U0 preserveindent copyindent softtabstop=0 shiftwidth=2 tabstop=2 autoindent smarttab

" Python
autocmd FileType python set cinoptions= nocindent shiftwidth=2 expandtab

" OpenFOAM/FreeFOAM
autocmd BufRead *.[CH] set expandtab shiftwidth=4 filetype=cpp cindent cinoptions=+s-2,(s,U1,is,g0,Ws,l1,t0 cinkeys=0{,0},0),:,!^F,o,O,e
