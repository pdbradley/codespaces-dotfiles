
inoremap jj <ESC>

call plug#begin('~/.config/nvim/autoload/plug.vim')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/VisIncr'
Plug 'elixir-editors/vim-elixir'
Plug 'janko-m/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'
Plug 'easymotion/vim-easymotion'


call plug#end()

" Leader
let mapleader = " "

set complete=.,b,u,]

" this setting below makes autocomplete always show the match and
" lets you just hit space to choose and go
set completeopt=longest,menuone


set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces


" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5


" Switch between the last two files
nnoremap <Leader><Leader>f <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" FZF {{{
nnoremap <Leader>p :Buffers<cr>
nnoremap <c-p> :GFiles --cached --others --exclude-standard<cr>
nnoremap <C-y> :execute 'Rg ' . input('Rg/')<CR>

"fzv for vim history.  ctrl-e lets you edit
nnoremap <leader><Leader>b :History:<CR>

" Always use vertical diffs
set diffopt+=vertical

set nospell

"avoid annoying error when git initiates a text edit
let g:go_version_warning = 0
let mapleader = " "
"disable folding by default
"set nofoldenable
"setlocal foldmethod=syntax
autocmd FileType javascript,typescript,json setlocal foldmarker={,}

"on any line, go to the first bracket on that line and create a fold
"useful for js and others
nnoremap <leader>fb 0f{zfa{

" Customizations
" set relativenumber
set number
set nocompatible
set showmatch
set ruler "show cursor position all the time
set showcmd "display incomplete commands
set autowrite " hopefully this will save buffers when I switch out of them
set laststatus=2 " always show status line
set smarttab
set noincsearch
set incsearch
set nohlsearch   "no highlighting
set guioptions-=m       " Can't remember :)
set guioptions-=T       " No toolbars
set guioptions-=r       " No scrollbars
set visualbell t_vb=    " Don't beep
set hidden              " Don't prompt to save when switching buffers

"scrolling speed
set ttyfast
"set ttyscroll=3  neovim doesnt like this
set lazyredraw

set backspace=2
"no backups since we are always in git (almost)
set nobackup
set nowritebackup
set noswapfile

" If a file is changed outside of vim, automatically reload it without asking
set autoread

"javascript vars for vim-javascript
let g:javascript_enable_domhtmlcss = 1

"fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'

"Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>:redraw!<CR>
map <Leader>s :call RunNearestSpec()<CR>:redraw!<CR>
map <Leader>l :call RunLastSpec()<CR>:redraw!<CR>
map <Leader>* :call RunAllSpecs()<CR>:redraw!<CR>
let g:rspec_command = ":silent !tmux send-keys -t spec 'clear' C-m 'bundle exec spring rspec --format progress --require ~/code/rspec_support/quickfix_formatter.rb --format QuickfixFormatter --out ~/quickfix.out --order rand {spec}' C-m"

" opens the quickfix file and window
map <leader><leader>j :cg ~/quickfix.out \| cwindow<CR>

map <leader>x :execute "silent !tmux send-keys -t 1 ls C-m "<CR>


"tabs
map <C-t> <esc>:tabnew<CR>

"shift direction to change tabs
noremap <S-l> gt

noremap <S-h> gT

noremap :W :wall<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

"indentation matters...
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set history=500

" syntax highlighting
syntax on 
filetype off
filetype plugin on

"Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" My Custom Mappings related to ctrl-p
" copied the idea for this from gary bernhardts vimrc
map <leader>gv :Files app/views<cr>
map <leader>gf :Files spec/factories<cr>
map <leader>gc :Files app/controllers<cr>
map <leader>gm :Files app/models<cr>
map <leader>gj :Files app/javascript<cr>
map <leader>gg :Files app/graphql<cr>
map <leader>gh :Files app/helpers<cr>
map <leader>gl :Files lib<cr>
map <leader>gsc :Files spec/controllers<cr>
map <leader>gsm :Files spec/models<cr>
map <leader>gsf :Files spec/features<cr>
map <leader>gsr :Files spec/requests<cr>
map <leader>gs :Files spec/<cr>
map <leader>. :CtrlPTag<cr>

"these two lines help w search.  case ignored unless search string has
"uppercase anywhere
set ignorecase
set smartcase

"assume /g flag is on for search and replace
set gdefault
set bg=light

set cursorline

"status line highlight
highlight StatusLine ctermfg=blue ctermbg=yellow

"rounds to the nearest indent point 
set shiftround

"make a little 5 line padding at top and bottom when scrolling
set scrolloff=5

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"get out of insert mode with a super seldom used character sequence
inoremap jj <ESC>

"no delay when hitting esc
" set noesckeys  neovim doesnt like this either

"some nice hashrocket ones
" cp copies and pastes the present paragraph (method)
nnoremap cp yap<S-}>p

" formats the current paragraph
nnoremap <leader>f<space> =ip



" turns on paste and nopaste (messes with my typing)
"set pastetoggle=<leader>z

"apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q

"quit files with leader q
nnoremap  <leader>q :q<cr>

"save files with leader s
nnoremap <leader>S :w<cr>

"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

"get to Ack quickly with leader a
nnoremap <leader>a :Ack

let g:ackprg = 'rg --vimgrep --no-heading'

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

"movement
nmap j gj
nmap k gk
"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au BufReadPost *.dwt set syntax=html

"pbcopy shortcuts to get to system clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
" use the system clipboard
"if $TMUX == ''
" set clipboard+=unnamedplus
"endif

"stop autocommenting of the next line under a comment
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"better instapaste (thanks orenstein!)
"map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

"grab into system clipboard
map <leader>y "*y

"ack on the word under the cursor
map <leader><leader>k :Ack <C-R><C-W><CR>

"projectionist heuristics for alternates
"let g:projectionist_heuristics = { "app/*.rb": {"alternate": "spec/{}_spec.rb"} }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE  thanks bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

colorscheme ron

"highlight debugging stuff so you don't miss it
au BufEnter *.rb syn match error contained "\<byebug\>"
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

"update any file you leave--always saved
autocmd BufLeave,FocusLost * silent! update

set autoread
set modifiable

"tmux nvim clipboard stuff
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> cp :call ClipboardPaste()<cr>p

"this creates necessary folders if a buffer's path doesn't exist
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END


vmap <leader>x <Plug>SendSelectionToTmux<cr>

let g:sql_type_default = 'pgsql'

"return in normal mode inserts line
" this screws up the quickfix!! how to solve?
nnoremap <Return> A<Return><Esc>
" with this!!  yeah!
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

highlight ColorColumn guibg=darkgrey ctermbg=darkgrey

"unset some thoughtbot stuff
set textwidth&
set colorcolumn&

"postgres editing stuff
syntax on
au BufRead /tmp/psql.edit.* set syntax=sql


"easymotion settings
let g:EasyMotion_do_mapping = 0 "disable all mappings
let g:EasyMotion_smartcase = 1 "case insensitive
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
"map <leader>j <Plug>(easymotion-j)
"map <leader>k <Plug>(easymotion-k)
"map <leader>w <Plug>(easymotion-w)
"map <leader>b <Plug>(easymotion-b)
