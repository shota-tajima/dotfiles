" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
    colorscheme desert
    " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
    " 読み込むプラグインの指定
    NeoBundle 'Shougo/neobundle.vim' "neobundleの導入
    NeoBundle 'Shougo/unite.vim' "ファイラー兼ランチャー、要勉強
    NeoBundle 'tpope/vim-surround' "囲むものを編集？
    NeoBundle 'nanotech/jellybeans.vim' "色管理
    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'open-browser.vim'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'tell-k/vim-browsereload-mac'
    NeoBundle 'hail2u/vim-css3-syntax'
    " NeoBundle 'taichouchou2/html5.vim'
    NeoBundle 'marijnh/tern_for_vim'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'tyru/caw.vim.git' "コメントアウトの設定
    " コメントアウトの設定
    nmap // <Plug>(caw:i:toggle)
    vmap // <Plug>(caw:i:toggle)
    " if_luaが有効ならneocompleteを使う
    NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
    " ...
    " 読み込んだプラグインの設定
    " NERDTreeの設定----------
    " 隠しファイルをデフォルトで表示させる
    let NERDTreeShowHidden = 1
    " デフォルトでツリーを表示させる
    "autocmd VimEnter * execute 'NERDTree'
    " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
    if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        filetype plugin indent off
        if has('vim_starting')
            set runtimepath+=~/.vim/bundle/neobundle.vim/
        endif
        try
            call neobundle#begin(expand('~/.vim/bundle/'))
            call s:LoadBundles()
            call neobundle#end()
        catch
            call s:WithoutBundles()
        endtry 
    else
        call s:WithoutBundles()
    endif

    NeoBundleCheck

    filetype indent plugin on
    syntax on
endfunction

call s:InitNeoBundle()

colorscheme jellybeans

set number         " 行番号を表示する
set tabstop=4
set shiftwidth=4
set expandtab     " タブ入力を複数の空白入力に置き換える
set scrolloff=8   " 上下8行の視界を確保
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする
set backspace=start,eol,indent
" マウスの入力を受け付ける
set mouse=a

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full


"コード補完neocompleteの設定
if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
