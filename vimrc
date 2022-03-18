"==============================================================================
" nungdo's vimrc
"
" Last modified 2020.04.07
"==============================================================================

"==============================================================================
" vim-plug
" After adding plugin, just do :PlugInstall
call plug#begin('~/.vim/plugged')
	Plug 'majutsushi/tagbar'
	Plug 'vivien/vim-linux-coding-style'
	Plug 'xolox/vim-misc'
	"Plug 'xolox/vim-easytags'
	Plug 'preservim/nerdtree'
	Plug 'whatot/gtags-cscope.vim'
	Plug 'ronakg/quickr-cscope.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'easymotion/vim-easymotion'
	"Plug 'airblade/vim-gitgutter'
	Plug 'edkolev/promptline.vim'
	Plug 'itchyny/calendar.vim'
	Plug 'mileszs/ack.vim'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'chriskempson/base16-vim'
	Plug 'kablamo/vim-git-log'
	Plug 'udalov/kotlin-vim'
	Plug 'tpope/vim-commentary'
	Plug 'KarimElghamry/vim-auto-comment'
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
call plug#end()

"==============================================================================
if &diff
    colorscheme iceberg
else
	colorscheme desert
endif

"==============================================================================
set nocompatible    " 오리지날 VI와 호환하지 않음
set autoindent      " 자동 들여쓰기
set cindent         " C 프로그래밍용 자동 들여쓰기
set smartindent     " 스마트한 들여쓰기
set wrap
set nolinebreak
"set nolist
"set cul            " 현재라인 하이라이트
"set nowrapscan     " 검색할 때 문서의 끝에서 처음으로 안돌아감
set nobackup        " 백업 파일을 안만듬
set visualbell      " 키를 잘못눌렀을 때 화면 프레시
set ruler
set nonu
set fileencoding=utf-8
set tenc=utf-8
set hlsearch
"set ignorecase
set noexpandtab        " tab을 space로 확장하지 말것
set tabstop=4
set textwidth=79
set shiftwidth=4
set incsearch
set background=dark " 하이라이팅 lihgt / dark
set backspace=eol,start,indent
set history=1000
set comments=sl:/*,mb:\ *,elx:\ */
set cc=81	"80 컬럼에 경계 표시
syntax on

"==============================================================================
if has("autocmd")
    filetype plugin indent on
endif

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

au BufRead,BufNewFile *.logcat set filetype=logcat

"==============================================================================
" quickr-cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"==============================================================================
" lightline.vim
set laststatus=2 " 상태바 표시를 항상한다
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
let g:lightline = { 'colorscheme': 'wombat', }

"==============================================================================
" git grep integration
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

"==============================================================================
"
"set tag=./tags;/
set tags=./tags,tags;./.tags,.tags;./.vscode-ctags,.vscode-ctags;

let g:linuxsty_patterns = [ "/kernel/", "/u-boot/", "/bl1/", "/driver/" ]
nnoremap <silent> <leader>a :LinuxCodingStyle<cr>


" easy-tag
" tags를 비동기로 불러와준다. (필수) tag사이즈가 커지게 되면 vim이 블록되는 시간이 길어져서 답답하다
"let g:easytags_async=1
" highlight를 켜면 좋지만 이것도 속도가 느려진다.
"let g:easytags_auto_highlight = 0
" struct의 멤버변수들도 추적이 된다.
"let g:easytags_include_members = 1
" 현재 프로젝트에서 쓰는 tags파일을 우선 로드하고 없을 경우 global tags를 로드한다.
"let g:easytags_dynamic_files = 1

"==============================================================================
nmap <F1> :Tlist<CR>
nmap <F2> :NERDTree<CR>
nmap <F3> :GtagsCursor<CR>
nmap <F4> :Gtags -r <CR><CR>
"nmap <F5> :Gtags -f <CR><CR>
nmap <F8> :TagbarToggle<CR>
nmap <F10> :bp<CR>

nnoremap <silent> <F5> zf}<CR>
nnoremap <silent> <F6> zo<CR>

map <C-n> :cn <CR>
map <C-p> :cp <CR>

noremap <leader>/ :Commentary<cr>

