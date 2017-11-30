" https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Temporarily disabled pending https://github.com/chriskempson/base16-vim/issues/162
" Plugin 'chriskempson/base16-vim' " (https://github.com/chriskempson/base16-vim)
Plugin 'editorconfig/editorconfig-vim' " (https://github.com/editorconfig/editorconfig-vim)
Plugin 'scrooloose/nerdtree' " (https://github.com/scrooloose/nerdtree)
Plugin 'vim-airline/vim-airline' " (https://github.com/vim-airline/vim-airline)
Plugin 'vim-airline/vim-airline-themes' " (https://github.com/vim-airline/vim-airline-themes)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Additional plugin configuration
syntax on
colorscheme base16-tomorrow-night
set noshowmode " (https://github.com/vim-airline/vim-airline/wiki/FAQ#how-do-i-get-rid-of-the-default-mode-indicator)
set laststatus=2 " (https://github.com/vim-airline/vim-airline/wiki/FAQ#vim-airline-doesnt-appear-until-i-create-a-new-split)
let g:airline_theme='tomorrow'

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

