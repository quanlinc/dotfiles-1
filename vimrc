" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'vim-scripts/paredit.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'

Bundle 'guns/vim-clojure-static'
Bundle 'vim-scripts/verilog_systemverilog.vim'

Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required!

syntax on
set hlsearch

" Custom Leader bindings
let mapleader=","
let maplocalleader="\\"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" numbers
set number
set numberwidth=4

set nobackup
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set statusline=%F%m%r%h%w\ 
set statusline+=%=
set statusline+=%{fugitive#statusline()}
set statusline+=\ [line\ %l\/%L]
set laststatus=2

" case only matters with mixed case expressions
set ignorecase
set smartcase

set nolist
set listchars=eol:¬,extends:»,tab:▸\ ,trail:›

set mouse=a

" Rainbow Parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" NERDTree
map <Leader>t :NERDTreeToggle<CR>
" Fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gl :Glog<CR>
map <Leader>gp :Git push<CR>
" Colorscheme stuff
set background=dark
colorscheme vividchalk

