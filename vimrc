filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()
    " Core
Plugin 'gmarik/Vundle.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'junegunn/fzf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'w0rp/ale'

    " UI
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'powerline/powerline'
Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'

    " Languages
Plugin 'plasticboy/vim-markdown'
Plugin 'jceb/vim-orgmode'
Plugin 'OmniSharp/omnisharp-vim'

    " Plugins
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-speeddating'

    " Other
Plugin 'rhysd/vim-clang-format'
Plugin 'python-rope/ropevim'
call vundle#end()


" Standard variables
syntax enable
filetype plugin indent on
set nocompatible
set ignorecase
set smartcase
set clipboard=unnamed
set number
set nobackup
set noundofile
set nowritebackup
set nohlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set foldmethod=syntax
set foldlevel=99
let mapleader = ' '


" Theming
let g:airline_theme = 'vorange'
colorscheme gruvbox


" Dir Config
let g:NERDTreeHijackNetrw = 1


" Language Config
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'


" Tool Config
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Keybinds
    " General keybind
nnoremap <leader>fed :e ~/.vimrc<CR>
nnoremap <leader>fei :e ~/.vim/ftplugin<CR>
nnoremap <leader>fer :so ~/.vimrc<CR>:PluginInstall<CR>

    " File Management
nnoremap <leader>fr :e!<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :wq<CR>
nnoremap <leader>fn :enew<CR>
nnoremap <F8> :set hlsearch! hlsearch?<CR>

    " Buffer Management
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bn :bn <CR>
nnoremap <leader>bp :bp <CR>
nnoremap <leader>bd :bd <CR>

    " Window Management
nnoremap <leader>ww :Windows<CR>
        " Splits
nnoremap <leader>w/ <C-W>v
nnoremap <leader>w- <C-W>s
nnoremap <leader>wd <C-W>q
        " Resizes
nnoremap <leader>w^ :resize -5<CR>
nnoremap <leader>w<Down> :resize +5<CR>
nnoremap <leader>w> <C-W>5>
nnoremap <leader>w< <C-W>5<
        " Movement
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

    " Searches
nnoremap <leader>ss :BLines <CR>
nnoremap <leader>sf :Lines <CR>
nnoremap <leader>ff :Files<CR>

    " Nerd Tree Config
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFocus<CR>

