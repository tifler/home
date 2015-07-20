colorscheme desert  "  vi 색상 테마 설정
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
set expandtab
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

if has("autocmd")
    filetype plugin indent on
endif

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"cscope
set csprg=/usr/bin/cscope

set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
endif
set csverb


" 자동으로 folding 정보를 저장한다.
"au BufWinLeave * mkview
" 저장된 folding 정보를 얻어온다.
"au BufWinEnter * silent loadview

set tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags,../../../../../../../../tags,../../../../../../../../../tags
nmap <F1> :Tlist<CR>
nmap <F2> :NERDTree<CR>

"map <C-n> :cn<CR>
"map <C-p> :cp<CR>
"map <C-]> :Gtags<CR><CR>
"map <C-\> :Gtags -r<CR><CR>

map <C-g> :Gtags 
map <C-h> :Gtags -f <CR><CR>
map <C-\> :Gtags -r <CR><CR>
map <C-j> :GtagsCursor <CR>
map <C-n> :cn <CR>
map <C-p> :cp <CR>

"nmap <C-\><C-]> :GtagsCursor<CR>

