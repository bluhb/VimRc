set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'junegunn/goyo.vim' 
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'junegunn/limelight.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold' "fold
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'vim-python/python-syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cocopon/iceberg.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'DomHudson/abstract.vim'
Plugin 'brafales/vim-desert256'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'chriskempson/base16-vim'
Plugin 'rakr/vim-one'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'haensl/mustang-vim'
Plugin 'gregsexton/Atom'
Plugin 'endel/vim-github-colorscheme'
Plugin 'fneu/breezy'
Plugin 'jnurmine/Zenburn'
Plugin 'ayu-theme/ayu-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"noremap j gj
"noremap k gk

nnoremap <TAB> <c-w>w
nnoremap <S-TAB> <c-w><LEFT>
noremap <F12> :NERDTreeToggle<CR>

nnoremap <F7> :Limelight!<CR>
nnoremap <F6> :Limelight0.8<CR>
nnoremap <F9> :Goyo<CR>

set hlsearch
set incsearch
set ignorecase
set smartcase
set foldmethod=indent
set shiftwidth=4

noremap <CR> :nohlsearch<CR>

set rtp+=~/.vim/bundle/taboo.vim

set number relativenumber
syntax on
set showmatch
set ruler
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
set linebreak

set tags+=tags;~ "requires Ctags to be installed on the system

set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -src-specials -interaction=nonstopmode --shell-escape $*'

let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -src-specials -interaction=nonstopmode --shell-escape $*' 
let g:Tex_MultipleCompileFormats='pdf,bib,pdf,pdf'
let g:Tex_ViewRule_pdf = 'zathura' "this worked! 
"let g:Tex_ViewRule_pdf = 'okular --unique'
let g:tex_flavor='latex' "Use vim-latex even when *.tex file is newcreated)
let g:Tex_package_detected = 'graphicx'
autocmd BufEnter *.tex set sw=2
autocmd BufEnter *.tex set iskeyword+=:
au BufWritePost *.tex silent call Tex_CompileLatex()
"autocmd BufEnter *.tex let g:Tex_EnvLabelprefix
"autocmd BufEnter *.tex set Tex_EnvEndWithCR=1

map <F2> :w<cr><cr><F3>
imap <F2> <esc>:w<cr><F3><esc>a
map <F3> <leader>ls
imap <F3> <esc><leader>ls
set spell spelllang=en_us
"set spell spelllang=nl

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

 "Use a blinking upright bar cursor in Insert mode, a blinking block in normal
"if &term == 'xterm-256color' || &term == 'screen-256color'
    "let &t_SI = "\<Esc>[5 q"
    "let &t_EI = "\<Esc>[1 q"
"endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"if exists('$TMUX')
    "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"endif

set guioptions -=m
set guioptions -=T
set guioptions -=r "right hand scrollbar
set guioptions -=L "left hand scrollbar 
"set guifont=Fira\ Code\ Retina\ 11
"set guifont=Fira\ Code\ Light\ 11
"set guifont=Inconsolata\ Medium\ 12
"set guifont=Ubuntu\ Mono\ Regular\ 13

autocmd BufRead,BufNewFile *py imap <buffer> <F5> <Esc>:w<CR>:cd %:p:h<CR>:!clear;python3 "%"<CR>
autocmd BufRead,BufNewFile *py nmap <buffer> <F5> <Esc>:w<CR>:cd %:p:h<CR>:!clear;python3 "%"<CR>
autocmd BufRead,BufNewFile *py setlocal colorcolumn=100
let g:python_highlight_all = 1 

autocmd FileType cpp nnoremap <buffer> <F5> <Esc>:w<CR>:!compile %:r<CR>
autocmd FileType cpp inoremap <buffer> <F5> <Esc>:w<CR>:!compile %:r<CR>


set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_dark = 'medium'
"let g:gruvbox_contrast_light = 'hard'
set background=dark " Setting dark mode
"set background=light " Setting light mode
colorscheme gruvbox
"colorscheme iceberg
"colorscheme monokai
"colorscheme OceanicNext
"colorscheme PaperColor
"colorscheme one
"colorscheme jellybeans
"colorscheme breezy
"colorscheme pencil

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> :hi SpellBad cterm=underline guifg=red guibg=NONE<CR>

hi SpellBad cterm=underline guifg=red


autocmd BufRead,BufNewFile *md nnoremap <F2> <Esc>:w<CR>:cd %:p:h<CR>:!pandoc --filter pandoc-citeproc % -s -o %:r.pdf<CR><CR>:cd<CR>

if has("gui_running")
    set lines=40 columns=150
    map <silent> <F11>
        \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
endif

"--EMMET CONFIG--
"let g:user_emmet_leader_key=',' 
let NERDTreeShowBookmarks=1
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
set mouse=a

"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>h :set cursorline!<CR>

map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0i


nmap <Leader>1 <Plug>(Limelight)
xmap <Leader>1 <Plug>(Limelight)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#83a598'

" Default: 0.5
let g:limelight_default_coefficient = 0

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1 

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen 
command GREPA :execute 'vimgrep /'.expand('<cword>').'/gj **/*.'.expand('%:e')| copen

"https://vi.stackexchange.com/questions/3725/swap-the-position-of-two-windows
function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

command! Wswap :call WinBufSwap()
map <Leader>bs <C-c>:call WinBufSwap()<CR>

autocmd BufEnter * silent! lcd %:p:h "https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
set shellcmdflag=-ic "https://stackoverflow.com/questions/4642822/commands-executed-from-vim-are-not-recognizing-bash-command-aliases

let g:minimap_toggle='<S-m>'
