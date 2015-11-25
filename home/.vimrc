" 
" Note. brew install vimしないとクリップボードとの連携機能が使えません。

" 表示設定
"" 行番号
set number
"" ルーラー (右下にカーソル行,列などを表示してくれる)
set ruler
"" 行の折り返し無効
set nowrap

" 文字色設定
"" 構文ハイライトを有効にする
syntax enable
"" カラースキーマ
colorscheme desert

" 検索
"" デフォルトでは検索ワード入力後に検索されるが、インクリメンタル検索を可能にする
set incsearch
"" 検索結果をハイライトする
set hlsearch
"" ファイル末尾まで進んだら先頭から再び検索しない
set nowrapscan
"" 検索パターンで大文字小文字を区別しない
set ignorecase
"" 検索パターンが大文字を含んでいたらオプション'ignorecase'を無効にする
set smartcase

" インデント
"" Tabをスペースn文字分として表示
set tabstop=4
"" 自動インデント
set autoindent
"" tabをスペースに置き換える
set expandtab
"" vimが挿入するインデントの幅
set shiftwidth=4

" カーソル移動
"" 上下n行の視界を確保
set scrolloff=8
"" 左右n文字の視界を確保
set sidescrolloff=8
"" 左右スクロールはn文字ずつ
set sidescroll=1

" ファイル
"" 未保存ファイルがあっても別のファイルを開ける
set hidden

" コマンドライン
"" コマンドラインモードでTABキーによるファイル名保管を有効にする
set wildmenu wildmode=list:longest,full
"" 履歴をn件保存する
set history=2000

" よく使うコマンドのキーバインド変更
" (タイプ数を減らしたり、打ちやすいキーにマッピング)
"" ファイル関連
""" ファイル保存
nnoremap <space>w :<C-u>w<CR>
""" 終了
nnoremap <space>q :<C-u>q<CR>
""" 保存せずに終了
nnoremap <space>Q :<C-u>q!<CR>
"" カーソル移動
""" 行頭移動
nnoremap <space>h ^
""" 行末移動
nnoremap <space>l $
"" 検索
""" ハイライトを消す
nnoremap <silent> <esc><esc> :noh<return>
""" カーソル位置の単語で検索
nnoremap <space>/ *<C-o>
"" タブ
""" 新規タブ作成
nnoremap <silent> tt :<C-u>tabe<cr>
""" 次のタブへ移動
nnoremap <C-p> gT
""" 前のタブへ移動
nnoremap <C-n> gt
"" 置換
""" sedと入力すると置換スニペット
nnoremap sed :<C-u>%s///g<Left><Left><Left>

" OSとの連携
"" クリップボードと連携
set clipboard=unnamed,unnamedplus
"" マウスと連携
set mouse=a
"" インサートモードから抜けたらIME off
set iminsert=0 imsearch=0
"" deleteキーを効くようにする(brew install vimした場合のみこの設定が必要)
set backspace=indent,eol,start

" 文字コード
set encoding=utf8
set fileencodings=iso-2022-jp,sjis,japanese,euc-jp,utf-8

" NeoBundle
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここに入れたいプラグインを記入

call neobundle#end()
filetype plugin indent on




