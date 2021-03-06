" Section for `vim-plug`
call plug#begin('~/.vim/bundle')

" Add plugins to &runtimepath
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': 'html' }

"" snippet plugins
" the engine
Plug 'SirVer/ultisnips'
" snippets
Plug 'honza/vim-snippets'

"" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
"" *.c --> *.h
Plug 'a.vim', { 'for': ['c', 'cpp'] }
"" Auto Pairs
Plug 'jiangmiao/auto-pairs'
"" Python 3 syntax highlight
"Plugin 'hdima/python-syntax'
"" Flake8
Plug 'nvie/vim-flake8', { 'for': 'python' }
"" Indention for pep8
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
"" vim-latex: tools suite
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
"" fcitx-vim-osx: Restore input method state
Plug 'CodeFalling/fcitx-vim-osx'
"" vim-javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"" commenter
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'Yggdroot/indentLine', { 'for': ['ruby', 'python'] }
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
" Add `end` wisely
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-dispatch'
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['lisp', 'racket', 'scheme'] }
" Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'jpo/vim-railscasts-theme'
" rust syntax highlight
Plug 'rust-lang/rust.vim', { 'for': 'rust', 'do': 'cargo install rustfmt' }
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-repeat'

call plug#end()

" enable syntax highlighting
syntax enable
" show line numbers with relative number
set number
set relativenumber
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
" show command on left-down corner
set showcmd
" background setting
set background=dark

"" FFmpeg Code Formatting
" indentation rules for FFmpeg: 4 spaces, no tabs
"set expandtab
"set shiftwidth=4
"set softtabstop=4
"set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake setlocal noexpandtab shiftwidth=8 softtabstop=8
autocmd FileType make,automake highlight clear ForbiddenWhitespace
" Trailing whitespace and tabs are forbidden, so highlight them.
"highlight ForbiddenWhitespace ctermbg=red guibg=red
autocmd Filetype c,cpp,ruby highlight ForbiddenWhitespace ctermbg=red guibg=red
autocmd Filetype c,cpp,ruby match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
autocmd Filetype c,cpp,ruby autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" python.vim options
" enable all Python syntax highlighting features
let python_highlight_all = 1
" c.vim options
" make *.h using c highlight
let c_syntax_for_h = 1
" make compound literals in parenthese not error
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

" function for TwiddleCase in selected text.
" usage: select text in visual mode and press `~` to switch in `UPPER CASE`,
" `lower case` and `Title Case`.
" from: http://vim.wikia.com/wiki/Switching_case_of_characters#Twiddle_case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


""""""""""""""""""
"" tmux settings "
""""""""""""""""""
" reshape cursor in tmux according to mode
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
    if exists('$ITERM_PROFILE')
        if exists('$TMUX')
            let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
            let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        else
            let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        endif
    endif
endif


"""""""""""""""""""""
"" NERDTree setting "
"""""""""""""""""""""
map <C-t> :NERDTree<Enter>

"""""""""""""""""""""""""
"" Intent_guide settings"
"""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 0

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
au Filetype cpp nnoremap <c-l> :YcmDiags<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
" Ycm Fixit feature
nnoremap <c-h> :YcmCompleter FixIt<CR>
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Used for choose python version
"let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_detailed_diagnostics = ''

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
" Indent style for ruby & eruby
autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2
" Using tabs in go
autocmd FileType go setlocal noexpandtab shiftwidth=8 softtabstop=8
" Protocol buffer
autocmd Filetype proto setlocal ts=2 sts=2 sw=2
" c++ indent
"autocmd Filetype cpp setlocal ts=2 sts=2 sw=2

" clang-format in vim
autocmd Filetype c,cpp map <C-K> :%pyf /usr/local/Cellar/clang-format/2016-08-03/share/clang/clang-format.py<cr>

" statusline modified derived from jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=[%n]\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=%=                           " right align
set statusline+=%{strlen(&ft)?&ft:'none'}\ \|   " filetype
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}\ \| " encoding
set statusline+=\ %{&fileformat}              " file format
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%8l,%c%V%)\ %<%P        " offset

""""""""""""""""""""
" vim-go settings"""
""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"
let g:go_dispatch_enabled = 1

au FileType go nnoremap <Leader>ds <Plug>(go-def-split)
au FileType go nnoremap <Leader>dv <Plug>(go-def-vertical)
au FileType go nnoremap <Leader>dt <Plug>(go-def-tab)
au FileType go nnoremap <Leader>si :GoSameIds<CR>

"""""""""""""""""""""""""""
" rainbow_parentheses.vim""
"""""""""""""""""""""""""""
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

"""""""""""""""""""""""""""
" railscasts colorscheme""""""
"""""""""""""""""""""""""""
colorscheme railscasts

"""""""""""""""""""""""""""
" rust.vim settings """""""
"""""""""""""""""""""""""""
"let g:rustfmt_autosave = 1
"let g:rustfmt_fail_silently = 1
