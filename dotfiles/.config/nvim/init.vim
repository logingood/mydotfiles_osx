let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

set nocompatible
filetype off
set rtp+=$HOME/.nvim/bundle/Vundle.vim

"Enable project specific vimrc
set exrc
"Disable unsafe commands in project specific vimrc
set secure

call vundle#begin('~/.nvim/bundle')

"Vim extensions.
Plugin 'VundleVim/Vundle.vim' 				        "Package manager.
Plugin 'Valloric/YouCompleteMe'				        "Autocompleter for C family languages.
Plugin 'scrooloose/nerdtree'				        "Midnight commander style tree view.
Plugin 'tpope/vim-surround'				            "Parentheses, brackets, quotes, XML tags and more.
Plugin 'terryma/vim-multiple-cursors'			    "Sublime text style multi cursor.
Plugin 'vim-airline/vim-airline'			        "Lean and mean status and tabline for vim that's light as air. Based on powerline.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Mattn/emmet-vim'				            "Provides support for expanding abbreviated HTML + CSS.
Plugin 'tomtom/tcomment_vim'				        "An extensible & universal comment vim-plugin that also handles embedded filetypes.
Plugin 'Raimondi/delimitMate'				        "Provides insert mode auto-completion for quotes, parentheses and brackets etc.
Plugin 'yegappan/greplace'                          "Easy project wide find and replace for vim.
Plugin 'tpope/vim-fugitive'                         "Git for vim
Plugin 'christianrondeau/vim-base64'                "Encode/decode base64 strings
Plugin 'ntpeters/vim-better-whitespace'             "Highlight trailing whitespace

"Language and syntax plugins.
Plugin 'vim-ruby/vim-ruby'				            "Config files for writing Ruby in vim.
Plugin 'mxw/vim-jsx'                                "JSX syntax highlighting and indenting for vim.
Plugin 'elixir-lang/vim-elixir'				        "Config files for writing Elixir in vim.
Plugin 'pangloss/vim-javascript'			        "Config files for wrirint Javascript in vim.
Plugin 'cakebaker/scss-syntax.vim'			        "Syntax file for SCSS.
Plugin 'othree/javascript-libraries-syntax.vim'		"Syntax for Javascript libraries.
Plugin 'kylef/apiblueprint.vim'                     "Syntax highlighting and linting for API Blueprint.
Plugin 'hashivim/vim-terraform'                     "Syntax for terraform files
Plugin 'fatih/vim-go'                               "Go language plugin

"Colorschemes
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'shannonmoeller/vim-monokai256'
Plugin 'junegunn/seoul256.vim'                      "Low contrast vim colour scheme based on Seoul Colors

" Tmux status line
Plugin 'edkolev/tmuxline.vim'
call vundle#end()			    		"required

filetype plugin indent on 				"required

set nu
syntax on
let &t_Co=256
set background=dark

let g:monokai256_background = 233
" colo monokai256
colo monokai256


" FZF
set rtp+=/usr/local/opt/fzf
map <c-p> :FZF<CR>

"Define odd extensions
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.jsx.erb set filetype=javascript.jsx

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>' use 4 spaces
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby,yaml,yml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

set clipboard=unnamed
set iskeyword+=-
set autoread

"Map ctrl-k to NERDTree
map <c-k> :NERDTreeToggle<CR>
map <c-j> :NERDTreeFind<CR>

"Enable mouse for scrolling
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"Airline config. Show tabline and show buffer numbers.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

"Javascript libraries used
let g:used_javascript_libs = 'jquery,angularjs,angularuirouter,jasmine,underscore,react'

"Exclude some files from ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" Experimentally integrate YouCompleteMe with vim-multiple-cursors, otherwise
" the numerous Cursor events cause great slowness
" (https://github.com/kristijanhusak/vim-multiple-cursors/issues/4)
function Multiple_cursors_before()
    let s:old_ycm_whitelist = g:ycm_filetype_whitelist
    let g:ycm_filetype_whitelist = {}
endfunction

function Multiple_cursors_after()
    let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endfunction

" Do not pad delimiters with spaces
let delimitMate_expand_space = 0

" Cursor dark grey
highlight Visual cterm=bold ctermbg=darkgray ctermfg=NONE

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red

" Terraform syntax indentation
let g:terraform_align=1

" Go syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1

set tabstop=2
set shiftwidth=2
set expandtab

autocmd BufWritePre *.rb,*.go,*.py,*.sh,*.json,*.md,.gitconfig,*.lua,*.c,*.cpp,*.h,*.js %s/\s\+$//e

let g:airline_theme='molokai'
hi Comment          ctermfg=247

