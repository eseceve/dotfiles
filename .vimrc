" Required options ============================================================
  set nocompatible
  set ttymouse=sgr
  set ballooneval
  set balloonevalterm

" Utilities ===================================================================


" Plugins with vim-plug =======================================================
  call plug#begin()
    " General
      Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline for Vim
      Plug 'wakatime/vim-wakatime'

    " Git and GitHub
      Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
      Plug 'tpope/vim-git' " Vim Git runtime files
      Plug 'tpope/vim-fugitive' " I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time
      Plug 'tpope/vim-rhubarb' " Github extesion for fugitive.vim

    " Programming
      Plug 'tpope/vim-commentary' " commentary.vim: comment stuff out

    " Colorsquemes
      Plug 'tomasiser/vim-code-dark'

    " javascript
      Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }
      Plug 'maxmellon/vim-jsx-pretty', { 'for' : ['javascript', 'typescript'] } " The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
      Plug 'elzr/vim-json', { 'for': 'json' }
      Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
      Plug 'neoclide/coc.nvim', {'branch': 'release'}

  call plug#end()

  " Config plugins
    for file in split(glob('~/.vim/config/*.config.vim'), '\n')
      exe 'source' file
    endfor

" Set options ================================================================
  " General
    " Colorschemes
    set t_Co=256
    set t_ut=
    colorscheme codedark

    " filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
      if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
      else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
      endif
    endif

    set vb t_vb=                        " Disble beep
    set autowrite                       " Automatically write a file when leaving a modified buffer
    set autoread                        " Read files if changed outside
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

  " Setting up the directories
    if exists('*mkdir') && !isdirectory($HOME.'/.vim/files')
      call mkdir($HOME.'/.vim/files')
      call mkdir($HOME.'/.vim/files/backup')
      call mkdir($HOME.'/.vim/files/info')
      call mkdir($HOME.'/.vim/files/swap')
      call mkdir($HOME.'/.vim/files/undo')
    endif

    if has('persistent_undo')
      set undofile                " So is persistent undo ...
      set undolevels=1000         " Maximum number of changes that can be undone
      set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
      set undodir=$HOME/.vim/files/undo/
    endif

    " set backup
    set backupdir=$HOME/.vim/files/backup/
    set backupext=-vimbackup
    set backupskip=
    set directory=$HOME/.vim/files/swap/
    set updatecount=100
    set viminfo='100,n$HOME/.vim/files/info/viminfo

  " Vim UI
    set laststatus=2                  " Always show statusline
    set tabpagemax=15                 " Only show 15 tabs
    set noshowmode                    " Hide the current mode

    set cursorline                    " Highlight current line
    set colorcolumn=100               " [handle by editorConfig] Highlight column 80

    set signcolumn=yes
    highlight clear SignColumn        " SignColumn should match background
    highlight clear LineNr            " Current line number row will have same background color in relative mode

    set ruler                         " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                       " Show partial commands in status line and
                                      " Selected characters/lines in visual mode

    set backspace=indent,eol,start    " Backspace for dummies
    set linespace=0                   " No extra spaces between rows
    set number                        " Line numbers on
    set showmatch                     " Show matching brackets/parenthesis
    set incsearch                     " Find as you type search
    set hlsearch                      " Highlight search terms
    set winminheight=0                " Windows can be 0 line high
    set ignorecase                    " Case insensitive search
    set smartcase                     " Case sensitive when uc present
    set wildmenu                      " Show list instead of just completing
    set wildmode=list:longest,full    " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]     " Backspace and cursor keys wrap too
    set scrolljump=5                  " Lines to scroll when cursor leaves screen
    set scrolloff=3                   " Minimum lines to keep above and below cursor
    set foldenable                    " Auto fold code
    set foldmethod=indent             " Fold code before open a new file
    set foldlevel=99                  " Folding start closes
    set list
    set listchars=tab:→→,nbsp:·,eol:¬,trail:·,extends:# " Highlight problematic whitespace

  " Formatting
    set nowrap                        " Do not wrap long lines
    set autoindent                    " Indent at the same level of the previous line
    set shiftwidth=2                  " Use indents of 4 spaces
    set expandtab                     " Tabs are spaces, not tabs
    set tabstop=2                     " An indentation every four columns
    set softtabstop=2                 " Let backspace delete indent
    set nojoinspaces                  " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                    " Puts new vsplit windows to the right of the current
    set splitbelow                    " Puts new split windows to the bottom of the current
    set matchpairs+=<:>               " Match, to be used with %
    set pastetoggle=<F12>             " pastetoggle (sane indentation on pastes)
    set comments=sl:/*,mb:*,elx:*/    " auto format comment blocks

    set fileencoding=utf-8            " Default file encoding
    set fileformats=unix,dos,mac      " Support all EOLs by default
    set fileformat=unix               " Default end of line


" Mapping =====================================================================
  let mapleader = ','
  let maplocalleader = '_'

  " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>


  " Toggle ['] and [`] keys for moving to marks
    nnoremap ' `
    nnoremap ` '

  " Better navigation in long lines
    nnoremap j  gj
    nnoremap k  gk

  " Remap keys that will be used as normal mode mappings
    nnoremap <silent>   <space>h      H
    nnoremap <silent>   <space>m      M
    nnoremap <silent>   <space>l      L

  " Buffers
    nnoremap <silent>   K             <C-^>
    nnoremap            H             :bprevious<CR>
    nnoremap            L             :bnext<CR>

  " Make Y consistent with C and D.  See :help Y.
    nnoremap Y y$

  " Disable unwanted keys in normal mode
    nnoremap            <F1>          <nop>
    nnoremap            Q             <nop>

  " Write as sudo
    cnoremap            w!!           w !sudo tee % >/dev/null

  " Better tags navigation
    nnoremap            <C-]>         g<C-]>
    vnoremap            <C-]>         g<C-]>
    nnoremap            g<C-]>        <C-]>
    vnoremap            g<C-]>        <C-]>

  " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
      nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
    endif

  " Plugins mapping
    for file in split(glob('~/.vim/config/*.mapping.vim'), '\n')
      exe 'source' file
    endfor

" Auto commands ===============================================================

  augroup vimrc_autocommands
  autocmd!

  " Restore cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Automatically close popup menu and preview window for omnicompletion
    autocmd CursorMovedI,InsertLeave *
        \ if pumvisible() == 0 |
        \   silent! pclose |
        \ endif

  " Always put quickfix window in the bottom
    autocmd FileType qf wincmd J

  " If last windows is quickfix window, exit Vim
    autocmd BufEnter *
        \ if &buftype=="quickfix" || &buftype=="nofile" |
        \   if winbufnr(2) == -1 |
        \     quit! |
        \   endif |
        \ endif

  " Move to the parent directory in any fugitive tree or blob
    autocmd User Fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <silent> <buffer> .. :edit %:h<CR> |
        \ endif

  " Autoclean fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete

  " Always start on first line of Git commit message
    autocmd BufEnter *
        \ if &filetype == 'gitcommit' |
        \   call setpos('.', [0, 1, 1]) |
        \ endif

  " some
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

  " Plugins autocommand
    for file in split(glob('~/.vim/config/*.auto.vim'), '\n')
      exe 'source' file
    endfor

  " Rename Tmux pane with filename of vim buffer or repository name
    autocmd VimEnter * call system("tmux select-pane -T " . expand("%:t"))
    autocmd VimLeave * call system("tmux select-pane -T $(basename `git rev-parse --show-toplevel`)")

  " Improved perf of syntax highlighting
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  augroup END
