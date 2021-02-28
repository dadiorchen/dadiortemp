let mapleader=","
set notimeout
set nottimeout
" ------------------------------------------------------deanchen ---------------------------------------------------
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
"!this is important, if don't set it, will cause wrong format code behavior
filetype plugin indent on
set viminfo='500,<1000,s100,:0
syntax on

"tab
"tab is tab
"set tabstop=2
"set shiftwidth=2
"tab is spaces
set tabstop=2 
set softtabstop=0 
set expandtab 
set shiftwidth=2 
set smarttab


set autoindent
set number
set laststatus=2
"must set this to fix bug: can not backspace on tag
set backspace=2		" more powerful backspacing
set hls
" disable lisp setting, because it disable the format(=) function
" set lisp
" au BufWinEnter * set lisp
" set autochdir
set fdm=marker
set spell spelllang=en_us,cjk
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
" set statusline=[%n]\ %t%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %l,%c\ %p%%\ 
"set statusline=[%n]\ %t%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ 
map <Leader>ss :set spell!<CR>
"After coc, no need spell
set nospell

"buffer
" in order to switch between buffers with unsaved change 
set hidden 
" map <s-tab> :bp<cr>
" map <tab> :bn<cr>
" map ,bd :bd<cr>
map <Leader>< :bp<CR>
map <Leader>> :bn<CR>
map <Leader>bd : bd<CR>

command! BD b # | bd #

"------------------------- key map ------------------------
let mapleader = ","
"switch and zoom in

" jump to N window
let i = 1
while i <= 9
    execute 'nnoremap <Leader>w' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
"nmap <D-Right> <C-W><C-W><C-E><C-W><C-W>
map <C-J> <C-W><C-W><C-E><C-W><C-W>
map <C-K> <C-W><C-W><C-Y><C-W><C-W>
"nmap <silent> gwd <C-W><C-W><C-D><C-W><C-W>
nmap <silent> gww <C-W><C-W>
nmap <silent> gwc <C-W>c
nmap <silent> gwC :bd!<CR>
nmap <silent> gwv <C-W>v<C-W><C-W>:e.<CR>
nmap <silent> gwo <C-W>o
nmap <silent> gwj <C-W>j
nmap <silent> gwJ <C-W>J
nmap <silent> gwk <C-W>k
nmap <silent> gwK <C-W>K
nmap <silent> gwh <C-W>h
nmap <silent> gwl <C-W>l
nmap <silent> gw] <C-W>j
nmap <silent> gw[ <C-W>k
" new direction
nmap <silent> gwe <C-W>k
nmap <silent> gkk <C-W>k
nmap <silent> gwE <C-W>k<C-W>_
nmap <silent> gwd <C-W>j
nmap <silent> gjj <C-W>j
nmap <silent> gwD <C-W>j<C-W>_
nmap <silent> gws <C-W>h
nmap <silent> ghh <C-W>h
nmap <silent> gwS <C-W>h<C-W>_
nmap <silent> gwf <C-W>l
nmap <silent> gll <C-W>l
nmap <silent> gwF <C-W>l<C-W>_
nmap <silent> gwt <C-W>t
nmap <silent> gwT <C-W>t<C-W>_
nmap <silent> gwb <C-W>b
nmap <silent> gwB <C-W>b<C-W>_
nmap <silent> gw_ <C-W>_
nmap <silent> gwa <C-W>_
nmap <silent> gwp <C-W>p
nmap <silent> gwP <C-W>P
"switch and zoom in
nmap <silent> gw- <C-W><C-W><C-W>_
nmap <silent> gwx <C-W><C-W><C-W>_
nmap <silent> gw= <C-W>=
nmap <silent> gww <C-W><C-P>
nmap <silent> gwn :sp<CR>
nmap <silent> gwN :vs<CR>
"To max a window in a new tab
nmap <silent> gwm :let $WINDOWS_CURRENT=bufnr('%')<CR>:$tabnew<CR>:execute 'b' . $WINDOWS_CURRENT<CR>
" jump to N window
let i = 1
while i <= 9
    execute 'nnoremap <silent> gw' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
nmap <silent> gw0 <C-W>b

map <Leader>, <C-^>
" inoremap ^F ^X^F
inoremap  
inoremap  
inoremap  
inoremap jj <ESC>
inoremap kk <ESC>
map <Leader>bn :bn<CR>
map <Leader>bp :bp<CR>

" tab settings
nmap <silent> gtc :tabclose<CR>
nmap <silent> gtC :windo bd!<CR>
nmap <silent> gtn :tabnew<CR>:tabmove<CR>
nmap <silent> gtN :tabnew<CR>
nmap <silent> gtf :tabn<CR>
nmap <silent> gts :tabprevious<CR>
nmap <silent> gt] :tabnext<CR>
nmap <silent> gt[ :tabprevious<CR>
nmap <silent> gtl :tabnext<CR>
nmap <silent> gth :tabprevious<CR>
nmap <silent> gt, :-tabmove<CR>
nmap <silent> gt< :0tabmove<CR>
nmap <silent> gt. :+tabmove<CR>
nmap <silent> gt> :tabmove<CR>
"nmap <s-tab> :tabprevious<cr>
"nmap <tab> :tabnext<cr>
nmap <silent> gt0 :tablast<CR>
nmap <silent> gt :<CR>
" map ,bd :bd<cr>
let n = 1
while n <= 9
    "execute 'nnoremap <silent> gt' . n . ' :tabfirst<CR>:tabnext ' . n . '<CR>'
    execute 'nnoremap <silent> gt' . n . ' :exe "tabn" '. n . '<CR>'
    let n = n + 1
endwhile

"jump to last visited tab
"if !exists('g:lasttab')
"  let g:lasttab = 1
"endif
"nmap <silent> gtt :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()
" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent> gtt :exe "tabn " . g:Lasttab<cr>

"tab + window
let o = 1
while o <= 5
  let p = 1
  while p <= 5
    "execute 'nnoremap <silent> g' . o . p . ' :tabfirst<CR>:tabnext ' . o . '<CR>:' . p . 'wincmd w<CR>'
    execute 'nnoremap <silent> g' . o . p . ' :exe "tabn" ' . o . '<CR>:' . p . 'wincmd w<CR>'
    let p = p + 1
  endwhile
  let o = o + 1
endwhile

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" just for example
"com -complete=custom,ListUsers -nargs=1 Finger !finger <args>
"fun ListUsers(A,L,P)
"    return system("cut -d: -f1 /etc/passwd")
"endfun
"
"com -nargs=1 -bang -complete=customlist,EditFileComplete
"		\ EditFile edit<bang> <args>
"fun EditFileComplete(A,L,P)
"    return split(globpath(&path, a:A), "\n")
"endfun

" the function to convert html to JSX format
"source ~/work/tools/vim/html2JSX.vim
"source ~/work/tools/vim/reactTemplate.vim
"--------------- spell --------------------
"open a new window (bottom) to display the spell command result ,usage:
" ,t  //execute spell on current file 
function! Spell()
	let fileName = @%
	botright new
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	silent! execute '$read !cspell --config ~/.cspell.json ' . fileName
	setlocal nomodifiable
	1
endfunction
nnoremap <Leader>s :call Spell()<cr>

"--------------- jump --------------------
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
"nmap <Leader>j :call GotoJump()<CR>

"-------------- window resize --------------
nnoremap <Leader>4 :vertical resize -5<cr>
nnoremap <Leader>2 :resize +5<cr>
nnoremap <Leader>3 :resize -5<cr>
nnoremap <Leader>1 :vertical resize +5<cr>

"------------- ignore camelCase -------------
" Ignore CamelCase words when spell checking
augroup filetypedetect
	" the following line makes vim ignore camelCase and CamelCase words so
	" they
	"   " are not highlighted as spelling mistakes
	autocmd Syntax * syn match CamelCase "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained
	" autocmd BufRead,BufNewFile *.js :setlocal ft=javascript
augroup END

"fun! IgnoreCamelCaseSpell()
"	syn match CamelCase /<[A-Z][a-z]+[A-Z].{-}>/ contains=@NoSpell transparent
"	syn cluster Spell add=CamelCase
"endfun
"autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()
"

" add a javascript reset file type
nnoremap <Leader>f :setlocal ft=javascript<cr>
nnoremap <Leader>F :setlocal ft=xml<cr>


"to format html
"usage: 
" 1. <Leader>F to convert to XML type file
" 2. V mode to select lines
" 3. <Leader>x to format the XML
"vnoremap <Leader>h :s/<\(.\{-}\)>/\r<\1>\r/g<cr>V'<:g/^\S*$/d<cr>V'<=
vnoremap <Leader>h :s/<\(.\{-}\)>/\r<\1>\r/g<cr>

"add comment to every selected lines //code 
vnoremap <Leader>c :s/\(.*\)/\/\/\1/g<cr>/SOME_CANT_FOUND<cr>

"to execute current file as bash shell script
nnoremap <Leader>q :% w !bash<cr>

"share clipboard with os
"set clipboard=unnamed




"do not remember the search action position for jump list 
nnoremap n :<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap N :<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>

"break here
nnoremap <Leader><CR> i<CR><ESC>

"highlight current cursor column
noremap <silent><leader>hh :execute 'set colorcolumn=' . virtcol('.')<CR>
nnoremap <silent><leader>hH :execute 'set colorcolumn=0'<CR>

"to insert timestamp at current cursor 
map <Leader>d :r !date<CR>i<BS><ESC>

"auto add highlight column at 80 col
au BufRead * set colorcolumn=80


"----------------------- plugin vim-plug --------------
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'git@github.com:Yggdroot/indentLine.git'
call plug#end()

"------------------------ ale ------------------------
let g:ale_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_completion_tsserver_autoimport = 0
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert
"nnoremap <leader>fn :ALENext -error<cr>
"nnoremap <leader>fp :ALEPrevious -error<cr>
map <F3> :ALEGoToDefinition<CR>
map <F9> :ALEFindReferences<CR>
map <F2> :ALEHover<CR>
map <leader>= :ALEFix<CR>
let g:ale_linters = {
  \   'javascript': ['eslint', 'prettier', 'fecs',  'tsserver', 'xo'],
  \}
let g:ale_fixers = {
  \   'javascript': ['eslint', 'prettier', 'fecs', 'tsserver', 'xo'],
  \}

"----------------------- filetype ---------------------
"for mac crontab  
autocmd filetype crontab setlocal nobackup nowritebackup
au BufEnter,BufRead *.ts set filetype=javascript
au BufEnter,BufRead *.tsx set filetype=javascript
au BufEnter,BufRead *.ts set omnifunc=ale#completion#OmniFunc
au BufEnter,BufRead *.tsx set omnifunc=ale#completion#OmniFunc
au BufEnter,BufRead *.js set omnifunc=ale#completion#OmniFunc


"---------------------- nerdtree ---------------------------------------------                                             
map <F1> :NERDTreeToggle<CR>
map <leader><F1> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize=34

"------------------- tag jump --------------
"jump to tag start
map <leader>tt  vat<ESC>'<
"jump to tag end
map <leader>te  vat<ESC>

map <leader>do  aø<ESC>
map <leader>da  aå<ESC>
map <leader>de  aæ<ESC>

"----------------- Indent Lines -------------
map <leader>il :IndentLinesToggle<ESC>

"---------------- fzf -----------------------
map <leader><space> :FZF<CR>


"--------------- search nvim ---------------
set wildignorecase

"---------------- coc --------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>ai :call CocActionAsync('runCommand', 'tsserver.organizeImports')<CR>
nmap <leader>ao :call     CocAction('runCommand', 'editor.action.organizeImport')<CR>
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
nmap <leader>ca  <Plug>(coc-codeaction)
" Do default action for previous item.
" Do default action for next item.
"nnoremap <leader>fp  <Plug>(coc-diagnostic-prev)
" Do default action for previous item.
"nnoremap <leader>fn  <Plug>(coc-diagnostic-next)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
nmap <leader>rn <Plug>(coc-rename)

"------------------ macro/memory -------------
nnoremap <leader>cs $a// eslint-disable-line<ESC>



"--------------- search -------------------
"USAGE
"<leader>gr
"[input keyword]
"search under the CMD dir
function! GrepSearch()
  let curline = getline('.')
  call inputsave()
  let name = input('Search: ')
  call inputrestore()
  "call setline('.', curline . ' ' . name)
  execute 'gr -REi "' . name . '" ./'
endfunction
nmap gss :call GrepSearch()<CR>

set wildignore=*/node_modules/*,*/.git/*
set grepprg=grep\ --exclude-dir={node_modules,.git}


"------------terminal-------------------
set shell=bash\ -l
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

"To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-\><C-\> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

"go to the current file's path
"USAGE: one a file, then press <F6>, this would open the
"term an current window, and cd to the current file's path
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>icd $VIM_DIR<CR>

"to open the file on current terminal's cd path
"USAGE: one a terminal, in normal mode, press <F7>, this would jump to command
"line and print the :e [pwd] to open the files under current path of terminal
map <F7> ipwd<Bar>pbcopy<CR><ESC>:sleep 1<CR>:e<SPACE><C-R>=getreg("+")<CR><BS>

" ------------------ e serier for terminal relatec -----------------
"to open a new tab and a terminal
nmap <silent> gee :$tabnew<CR>:term<CR>i
"to open a new window(sp) and a terminal
nmap <silent> ges :sp<CR><C-W>J:term<CR>i
nmap <silent> gen :term<CR>i
"tcd to current dir of the term
"this is for the convenience to open or browser the files under current dir
"nmap gec ipwd<Bar>pbcopy<CR><ESC>:sleep 100m<CR>:tcd<SPACE><C-R>=getreg("+")<CR><BS><CR>
nmap gec i<C-u>pwd<CR><ESC>:sleep 1000m<CR>k<S-v>y:tcd<SPACE><C-r>"<CR>
nmap geo i<C-u>pwd<CR><Esc>:sleep 1000m<CR>k<S-v>y:sp <C-r>"/

"copy selected text and paste to the command line
"usage: use v mode to select some lines/text in the terminal, hit this
"shortcut to copy these text then paste on the terminal prompt
map gep yi<C-\><C-\>"

au TermOpen * setlocal wrap


" ------------------- navigation ----------------------------------
"map <C-L> 1zl " Scroll 20 characters to the right
"map <C-H> 1zh " Scroll 20 characters to the left
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Left> :tabprevious<CR>
nnoremap <Up> <C-w>W
nnoremap <Down> <C-w>w
nnoremap <Right> :tabnext<CR>


"disable json sepcial char hidden
let g:indentLine_concealcursor = 0

" do not wrap the search
set nowrapscan


" ---------------- notes --------------------
" filter/format by prettier, can be used for formating json
" :'<,'>!prettier --stdin-filetype a.js

function! JumpDefinition()
  let curline = getline('.')
"  let filename = substitute(getline('.'), '\v^.*\(([a-zA-Z-_\.\/]+\.js):(\d+):(\d+)\).*$', '\1', '')
"  let line = substitute(getline('.'), '\v^.*\(([a-zA-Z-_\.\/]+\.js):(\d+):(\d+)\).*$', '\2', '')
  let filename = substitute(getline('.'), '\v^.{-}([a-zA-Z-_.\/]*\.js)[|:]=(\d+)=.*$', '\1', '')
  let line = substitute(getline('.'), '\v^.{-}([a-zA-Z-_.\/]*\.js)[|:]=(\d+)=.*$', '\2', '')
  echo line
  if(line =~ '\v\d+')
    exe 'sp +'. line . ' ' . filename
  else
    exe 'sp ' . filename
  endif
"  call inputsave()
"  let name = input('Search: ')
"  call inputrestore()
"  "call setline('.', curline . ' ' . name)
"  execute 'gr -REi "' . name . '" ./'
endfunction
nnoremap <leader>dd :call JumpDefinition()<CR>

nnoremap gdf :echo system('node ~/dadiortemp/openfile/nn.js cd')<CR>
