" Status Line
set rtp+=/Users/JonathanFung/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set laststatus=2
set t_Co=256

syntax on
filetype off
set encoding=utf8
set nocompatible
set number
set hlsearch
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set nofoldenable
set path=${PWD}/**

let mapleader="\\"
let maplocalleader="\\"


Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-scala.git'
Plugin 'szw/vim-ctrlspace.git'
Plugin 'junegunn/seoul256.vim.git'
Plugin 'Shougo/neocomplete.vim.git'

call vundle#end()
filetype plugin indent on

let g:seoul256_background = 233
colorscheme seoul256 

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" autocmd BufWritePost *.scala silent :EnTypeCheck

nnoremap <localleader>t :EnTypeCheck<CR>

let g:syntastic_debug = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['ensime']
let g:syntastic_aggregate_errors = 1

let g:ctrlspace_use_tabline = 1

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" let g:clang_user_options='|| exit 0'
" let g:clang_debug = 0
" let g:clang_complete_auto = 1
" let g:clang_complete_copen = 0
" let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
" 
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" 
set tags=./tags,tags,../tags;$HOME
" 
" nmap <silent> gl :Limelight!!<CR>
" xmap gl <Plug>(Limelight)
" 
" let g:goyo_width = 120
" 
" Find file in current directory and edit it.
" Deprecated in favor of native :find
" function! Find(name)
"   let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
"   let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
"   if l:num < 1
"     echo "'".a:name."' not found"
"     return
"   endif
"   if l:num != 1
"     echo l:list
"     let l:input=input("Which ? (CR=nothing)\n")
"     if strlen(l:input)==0
"       return
"     endif
"     if strlen(substitute(l:input, "[0-9]", "", "g"))>0
"       echo "Not a number"
"       return
"     endif
"     if l:input<1 || l:input>l:num
"       echo "Out of range"
"       return
"     endif
"     let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
"   else
"     let l:line=l:list
"   endif
"   let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
"   execute ":e ".l:line
" endfunction
" command! -nargs=1 Find :call Find("<args>")
