execute pathogen#infect()
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

filetype plugin indent on
syntax on
colorscheme molokai

au BufRead,BufNewFile *.go set filetype=go 

set laststatus=2  
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE



let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

set number
set cursorline 
hi CursorLine   cterm=NONE ctermbg=red 

set tabstop=2 shiftwidth=2 expandtab
set background=dark
set fdm=syntax

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
set clipboard=unnamed
" If installed using git
set rtp+=~/.fzf

let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0
