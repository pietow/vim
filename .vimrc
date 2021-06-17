set nocompatible          	 "test vim settings
so ~/.vim/plugins.vim
so ~/.vim/elint/elint.vim
so ~/.vim/prettier/prettier.vim
so ~/.vim/path/path.vim
so ~/.vim/vue/vue.vim

syntax enable


set backspace=indent,eol,start
set noeb vb t_vb=                "disable visual bell
set belloff=all
let mapleader = ','              "the default leader is \, but comma is used

set autowriteall 		"Autosave files when switching buffers
set complete=.,w,b,u
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set number                          "line number"
set novb                        "no visuell bell /flickering
"                          '  "qp to insert the macro into your let @q = '...' line
let g:auto_save = 1             "activate vim-autosave"

let g:camelcasemotion_key = '<leader>' "camelcasemotion plugin
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

let @c= '/"hvNld'
let @d= "/'hvNld"
let @a= "%di)"
let @w= "Da(pe%"
let @e= 'Da"pei"^[F"'
let @s= "Da'peF'"
let @y= "$%vBx$xB" "deletes line except braket content
let @b ="a �kb{{ }}bbwi i"
let @z= '%%wi class=""��a'
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
"

"-------------Visuals--------"
set t_CO=256
colorscheme atom-dark-256
"Color of Linenumbers
highlight LineNr ctermfg=yellow ctermbg=bg
"Fake custom left padding
set foldcolumn=1
hi foldcolumn ctermbg=bg

"Remove vertical boarder
hi vertsplit ctermfg=bg ctermbg=bg
"-------------Search--------"
set hlsearch
set incsearch

"-------------Split Managment--------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"prevent screen from jumping when shift-up/down is pressed
nmap <S-Up> :echo "no jumping up" <CR>
nmap <S-Down> :echo "no jumping down" <CR>
vnoremap <S-Up> :echo "no jumping up" <CR>
vnoremap <S-Down> :echo "no jumping down" <CR>

"jump to method/function"
map <c-9> <c-]>

"-------------Mapping--------"
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No left for you!"<CR>
inoremap <Right> <C-o>:echo "No left for you!"<CR>
nnoremap zt :echo "No annoying z top!"<CR>

"Cursor setting
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"Make it easy to edit vimrc"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>eb :tabedit ~/.vim/bundle/<cr>

"Sort PHP use statements 
vmap <Leader>su ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>1 :NERDTreeFind<cr>
nmap <Leader>2 :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

nmap <c-p> :CtrlP<cr>
nmap <c-t> :CtrlPBufTag<cr>
nmap <c-e> :CtrlPMRUFiles<cr>
"--------Plugins-----"

let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max,30,results:30'

"------Nerdtree-------"

let NERDTreeHijackNetrw = 0

"------greplace.vim-------"
set grepprg=ag						"use Ag for search

let g:grep_cmd_opts = '--line-numbers --noheading'      

"------matchit-------html tags match
filetype plugin on
runtime macros/matchit.vim

"------php-css-fixer.vim-------"
let g:php_cs_fixer_level = "psr2"

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>


"------pdv------- doc-blocks"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


"--------python----"
nmap <Leader>px :w <bar> :!python scanner.py<cr>
"--------Laravel-Specific-----"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>la :e routes/api.php<cr>
nmap <Leader>lc :e config/app.php<cr>
nmap <Leader>lds :e database/seeders/DatabaseSeeder.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader>lmp :!php artisan make:provider BlaServiceProvider
nmap <Leader>lmm :!php artisan make:model -mcr<left><left>  "resourceful controller
nmap <Leader>lmc :!php artisan make:controller -r<left><left>
nmap <Leader>lmf :!php artisan make:factory  --model=
nmap <Leader>lms :!php artisan make:seeder  
nmap <Leader>lmr :!php artisan make:request StorePostRequest
nmap <Leader>sd :!php artisan db:seed --class= Seeder
nmap <Leader>m :!php artisan migrate
nmap <Leader>mb :!php artisan migrate:rollback --step=
nmap <Leader>mf :!php artisan migrate:refresh --step=
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>hr :CtrlP<cr>app/Http/Requests/
nmap <Leader><Leader>m :CtrlP<cr>app/Models
nmap <Leader><Leader>r :CtrlP<cr>app/Repositories
nmap <Leader><Leader>p :CtrlP<cr>app/providers
nmap <Leader><Leader>s :CtrlP<cr>database/seeds
nmap <Leader><Leader>f :CtrlP<cr>database/factories
nmap <Leader><leader>dm :CtrlP<cr>database/migrations
nmap <Leader><Leader>v :e resources/views/<cr>
nmap <Leader><Leader>j :e resources/js/<cr>
nmap <Leader><Leader>js :e resources/js/store<cr>
nmap <Leader><Leader>jc :e resources/js/components<cr>
nmap <Leader><Leader>jg :e resources/js/components/gallery<cr>
nmap <Leader>ct :!ctags -R --languages=php<cr>

"---------Node
nmap <Leader>pj :e package.json<cr>
"---------Tailwind
nmap <Leader>tw :e tailwind.config.js<cr>
"--------webpack-----"
nmap <Leader>wd :!npm run dev
noremap<Leader><Leader>n :call Elint()<CR> 

"-------fixmyjs/eslint----"eslint is configured in .eslintrc"
noremap <Leader>js :Fixmyjs<CR>

"------prettier---- changes blade to html, calls prettier and changes html
"back to blade.php
nmap <Leader><Leader>b :call Pretty()<CR> 
nmap <Leader>p :Prettier<CR> 

"-----Move file in current dir
command! -nargs=1 F execute "call M('<args>')" 
"
"--------Namespace-----"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>f <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>f :call PhpExpandClass()()<CR>
"--------UltiSnips-----"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"---------Html emmet-----
let g:user_emmet_leader_key=','
au BufEnter *.php :UltiSnipsAddFiletypes blade.php


"---------Beautifier-----"
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" " for json
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" " for jsx
" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" " for html
" autocmd FileType blade.php nmap <Leader> <h> :call HtmlBeautify()<cr>
" nmap <Leader> <h> :call HtmlBeautify()<cr>
" " for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"--------Auto-Commands-----"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!     
	autocmd BufWritePost .vimrc source %
augroup END

" Set up persistent undo across all files.
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" Notes and Tips
"
" zz - centre Focus 
