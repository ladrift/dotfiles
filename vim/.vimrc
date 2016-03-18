""""""""""""""""""""
"" Vundle settings "
""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'

"" snippet plugins
" the engine
Plugin 'SirVer/ultisnips'
" snippets
Plugin 'honza/vim-snippets'

"" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"" *.c --> *.h
Plugin 'a.vim'
"" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
"" Python 3 syntax highlight
"Plugin 'hdima/python-syntax'
"" Flake8
Plugin 'nvie/vim-flake8'
"" Indention for pep8
Plugin 'hynek/vim-python-pep8-indent'
"" vim-latex: tools suite
Plugin 'vim-latex/vim-latex'
"" fcitx-vim-osx: Restore input method state
Plugin 'CodeFalling/fcitx-vim-osx'
"" seoul256 colorscheme 
"Plugin 'junegunn/seoul256.vim'
"" vim-javascript
Plugin 'pangloss/vim-javascript'
"" c++ enhanced highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
"" cpp11 syntax
"Plugin 'Cpp11-Syntax-Support'
"" STL syntax
Plugin 'Mizuchi/STL-Syntax'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" enable syntax highlighting
syntax enable
" show line numbers with relative number
set number relativenumber
" set tabs to have 4 spaces
set tabstop=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" keep indent size a multiple of shiftwidth
set shiftround
" take 4 spaces as a tab
set softtabstop=4
" show a visual line under the cursor's current line 
"set cursorline
" ingnore case in command completion and search
set ignorecase
" set for highligt searched text
set hlsearch

" python.vim options
" enable all Python syntax highlighting features
let python_highlight_all = 1
" c.vim options
" make *.h using c highlight
let c_syntax_for_h = 1
let c_no_curly_error = 1

" move vertically by visual line
nnoremap j gj
nnoremap k gk
" for quick <ESC>
inoremap jk <ESC>
" for easy leader
let mapleader = ","
" uppercase word under cursor in normal mode
nnoremap <C-c> viwUe

" set background on iterm profile
if $ITERM_PROFILE == 'working'
    set background=dark
else
    set background=light
endif


""""""""""""""""""
"" tmux settings "
""""""""""""""""""
" reshape cursor in tmux according to mode
if exists('$ITERM_PROFILE')
    if exists('$TMUX') 
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
end


"""""""""""""""""""""
"" NERDTree setting "
"""""""""""""""""""""
map <C-t> :NERDTree<Enter>

"""""""""""""""""""""""""
"" Intent_guide settings"
"""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 0

"""""""""""""""""""""
"" jedi-vim settings"
"""""""""""""""""""""
let g:jedi#completions_command = "<C-N>"

""""""""""""""""""""
"" snippet settings
""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" snippet directory
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
" snippet enable for cpp
autocmd! FileType cpp :UltiSnipsAddFiletypes cpp

""""""""""""""""""""
"" You Complete Me settings
""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '/Users/ladrift/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" show diagnostic list when <c-l>
nnoremap <c-l> :YcmDiags<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" Ycm Fixit feature
nnoremap <c-h> :YcmCompleter FixIt<CR>

""""""""""""""""""""
"" a.vim settings
""""""""""""""""""""
" move between *.cpp and *.h
nnoremap <Leader>ch :A<CR>
" display *.cpp or *.h in split-window
nnoremap <Leader>sch :AS<CR>

"""""""""""""""""""""""""""""""
"  vim-latex plugin settings  "
"""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


""""""""""""""""""""
"" Flake8 settings
""""""""""""""""""""
" auto Flake8 check on write
"autocmd BufWritePost *.py call Flake8()
autocmd FileType python noremap <C-p> :call Flake8()<CR>

""""""""""""""""""""""""""""""""""""""
"" vim-cpp-enhanced-syntax settings"""
""""""""""""""""""""""""""""""""""""""
"let c_no_curly_error=1

""""""""""""""""""""""""
"" cpp11 syntax"""""""""
""""""""""""""""""""""""
"au BufNewFile,BufRead *.cpp set syntax=cpp11

" Fullstack for js, html, css
autocmd Filetype html setlocal ts=2 sts=2 sw=2
" c++ indent
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2
