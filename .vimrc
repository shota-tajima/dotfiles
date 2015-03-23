"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required
call neobundle#begin(expand('~/.vim/bundle/'))
    " neobundle自体をneobundleで管理
    NeoBundleFetch 'Shougo/neobundle.vim'
    " 追加プラグイン
    NeoBundle 'Shougo/unite.vim'           " unite.vim
    NeoBundle "Shougo/vimproc", {
      \ 'build' : {
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
      \ },
    \ }
    NeoBundle 'Shougo/neomru.vim'          " 最近使ったファイル表示
    NeoBundle 'nanotech/jellybeans.vim'    " テーマ色
    NeoBundle 'mattn/emmet-vim'            " emmet
    NeoBundle 'Townk/vim-autoclose'        " かっこを勝手に閉じてくれる
    NeoBundle 'Shougo/neocomplete'         " 自動補完
    NeoBundle 'haya14busa/vim-easymotion'  " カーソル移動
    NeoBundle 'tpope/vim-endwise'          " Rubyのendを自動挿入
    NeoBundle "tyru/caw.vim.git"           " ファイルに合わせたコメント
call neobundle#end()
    
" Required
filetype plugin indent on
   
" 未インストールのプラグインを導入するかチェック
NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
" Start Color Settings.
"-------------------------
colorscheme jellybeans
"-------------------------
" End Color Settings.
"-------------------------

"-------------------------
" Start Default Settings.
"-------------------------
set number                              " 行番号を表示する
set tabstop=4                           " タブのサイズ
set shiftwidth=4                        " 自動インデントのサイズ
set expandtab                           " タブ入力を複数の空白入力に置き換える
set scrolloff=8                         " 上下8行の視界を確保
set hlsearch                            " 検索文字列をハイライトする
set incsearch                           " インクリメンタルサーチを行う
set ignorecase                          " 大文字と小文字を区別しない
set smartcase                           " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan                            " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                            " 置換の時 g オプションをデフォルトで有効にする
set backspace=start,eol,indent          " backspaceで挿入モードでも削除
set mouse=a                             " マウスの入力を受け付ける
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set clipboard+=unnamed                  " ヤンクの時にクリップボードにもセットする
"-------------------------
" End Default Settings.
"-------------------------

"-------------------------
" Start ShortCut Settings.
"-------------------------
" 行が折り返されてる時、表示行で移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 次の（前の）検索候補を画面の中心に表示
nnoremap n nzz
nnoremap N Nzz
" C,D,Yはカーソルから行末までの操作、cc,dd,yyは行全体の操作
nnoremap Y y$
" コマンドラインモードに入るのに;の方が楽
nnoremap ; :
nnoremap : ;
"保存して閉じる、保存せず閉じるが危険なので無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
"typo防止
nnoremap Q <Nop>
"行頭、行末へ移動
noremap <D-h>  ^
noremap <D-l>  $

"""
"unite.vim
"""
"インサートモードで開始
let g:unite_enable_start_insert=1
""ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"prefix keyの設定
nmap <Space> [unite]
"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"スペースキーとoキーでoutline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"スペースキーとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
"unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}
" agでgrep検索
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:.-buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

"""
"caw.vim
""""
"コメントをcommand + / で切り替え
nmap <D-/> <Plug>(caw:i:toggle)
vmap <D-/> <Plug>(caw:i:toggle)

"""
"emmet.vim
"""
" control + e で展開
let g:user_emmet_leader_key='<C-e>'

"""
"neocomplete
"""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
"-------------------------
" End ShortCut Settings.
"-------------------------
