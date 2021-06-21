filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim' "ctags must be installed
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv' "make doc-blocks
Plugin 'SirVer/ultisnips'
Plugin 'wavded/vim-stylus'
"Plugin 'posva/vim-vue'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'qpkorr/vim-renamer'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'gregsexton/MatchTag'
Plugin 'mg979/vim-visual-multi'
"Plugin 'preservim/nerdcommenter'
"
Plugin 'storyn26383/vim-vue'
Plugin 'tpope/vim-commentary'
Plugin 'jwalton512/vim-blade'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'tpope/vim-dispatch'             "| Optional
Plugin 'tpope/vim-projectionist'        "|
Plugin 'noahfrederick/vim-composer'     "|
Plugin 'noahfrederick/vim-laravel'
Plugin 'mattn/emmet-vim'
Plugin 'tkhren/vim-fake'
Plugin 'sunzhongwei/vim-laravel-snippets'
Plugin 'tpope/vim-eunuch'
Plugin '907th/vim-auto-save'
Plugin 'prettier/vim-prettier'
Plugin 'bkad/CamelCaseMotion'


"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
