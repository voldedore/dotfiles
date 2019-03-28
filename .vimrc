set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Show tree pane
Plugin 'scrooloose/nerdtree'
" Tree pane with git 
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Indentation line
Plugin 'Yggdroot/indentLine'

" Git support
Plugin 'tpope/vim-fugitive'

" Git Gutter (Git signs on the line column)
Plugin 'airblade/vim-gitgutter'

" fzf Fuzzy find
Plugin 'junegunn/fzf.vim'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
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

set laststatus=2
set number

let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = '%{fugitive#statusline()} BN: %{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_colors'

"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTreeFind
" Focus to edit pane after nerdtree opening
autocmd vimenter * wincmd p
" This will exit both NERDTree and VIM
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Customization for Yggdroot/indentLine
set shiftwidth=4

" Customization for airblade/vim-gitgutter
set updatetime=100
highlight GitGutterAdd		guifg=#009900 guibg=#232629 ctermfg=2 ctermbg=0
highlight GitGutterChange	guifg=#0044dd guibg=#232629 ctermfg=3 ctermbg=0
highlight GitGutterDelete	guifg=#ff2222 guibg=#232629 ctermfg=1 ctermbg=0

" Map Ctrl F for fzf :Files
map <C-f> :Files<CR>
