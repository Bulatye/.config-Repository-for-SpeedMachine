let g:python3_host_prog = '/usr/bin/python3'

set scrolloff=20
set encoding=utf-8
set noerrorbells
set mouse=a
set expandtab
set shiftround
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set cursorline
set undofile
set directory=~/.local/state/nvim/swap/
set noshowcmd
set clipboard=unnamedplus
set relativenumber

"=====================================================
" Installed Plugs
"=====================================================

call plug#begin('~/.vim/bundle')

" Graphical plugs
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto-complete
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"=====================================================
" End Plugins Block
"=====================================================

" Airline setup
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

"=====================================================
" Statuc bar setup
"=====================================================

set statusline=%f

" function that gets time
function! AirlineCurrentTime()
  return strftime("%H:%M")
endfunction

let g:airline_section_c = ''
let g:airline_section_x = '%{AirlineCurrentTime()}'
let g:airline_section_y = '%l'
let g:airline_section_z = '%L'

" Colorscheme setup
set termguicolors
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background=1
colorscheme tokyonight
highlight Comment ctermfg=White guifg=Whe

" Command Mode
nnoremap " :
" Save file
nnoremap s :w<CR>
" Source file
nnoremap S :source<CR>
" PlugInstall 
nnoremap <C-p> :PlugInstall<CR>

"=====================================================
" Movements
"=====================================================

" Movement j(left) k(down) l(up) ;(right)
nnoremap j h
" left
noremap k j
" down
nnoremap l k
" up 
nnoremap ; l
" right

" Movement in visual mode j(left) k(down) l(up) ;(right)
vnoremap j h
" left
vnoremap k j
" down
vnoremap l k
" up 
vnoremap ; l
" right

" Movement by words
nnoremap <C-j> ge
" left
nnoremap <C-;> e
" right

" Movement in visual mode by words
vnoremap <C-j> ge
" left
vnoremap <C-;> e
" right

" Move to start (J)and move to end (:) of line
nnoremap J 0
nnoremap : $

" Move in visual mode to start (J)and move to end (:) of line
vnoremap J 0
vnoremap : $

" Move to start (K) and move to end (L) of file
nnoremap <C-k> G
nnoremap <C-l> gg

" Move in visual mode to start (K) and move to end (L) of file
vnoremap <C-k> G
vnoremap <C-l> gg

" Fast Movement
nnoremap K 3j
nnoremap L 3k

" Fast Movement in visual mode
vnoremap K 3j
vnoremap L 3k

" move line down
nnoremap <A-k> :m .+1<CR>==

" move line up
nnoremap <A-l> :m .-2<CR>==

"=====================================================
" End Movements Block
"=====================================================

" delete in insert mode
inoremap <C-j> <C-h>

"=====================================================
" Python-mode settings
"=====================================================

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0


" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Добавление возможности выбора подсказки с помощью Tab
function! CheckBackspace() abort
  let col = col('.')
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Сопоставление клавиш для автодополнения
inoremap <silent><expr> <C-t>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<C-t>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Подтверждение автодополнения с помощью Enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
