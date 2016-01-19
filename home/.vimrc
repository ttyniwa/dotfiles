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

" カーソル
"" 上下n行の視界を確保
set scrolloff=8
"" 左右n文字の視界を確保
set sidescrolloff=8
"" 左右スクロールはn文字ずつ
set sidescroll=1
"" カーソル業をハイライト
set cursorline
"" カーソル行のハイライトスタイル
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

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
"" Note. brew install vimしないとクリップボードとの連携機能が使えません。
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

" 一時ファイル
"" バックアップファイルを作るディレクトリ
set backupdir=~/.vim/backup
"" ファイルを再度開きなおしした場合に開いていた位置を記憶するファイル
set directory=~/.vim/swp
"" ファイルを再度開き直した場合に前回のundo情報をレストア
set undofile
set undodir=~/.vim/undo

" モードライン（ファイルごとのエディタ設定）
set modeline
set modelines=5

""""""""""""""""""
" 以下vim plugin "
""""""""""""""""""

" NeoBundle
"" plugin
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Align'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'camelcasemotion'
NeoBundle 'elzr/vim-json'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vimwiki'
call neobundle#end()

"" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck
"" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on


""""""""""""""""""
" unite.vim
""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1

""""""""""""""""""
" CamelCaseMotion"
""""""""""""""""""
" w,b,eでのカーソル移動をキャメルケース対応
:map <silent> w <Plug>CamelCaseMotion_w
:map <silent> b <Plug>CamelCaseMotion_b
:map <silent> e <Plug>CamelCaseMotion_e

""""""""""""""""""
" vim-json       "
""""""""""""""""""
" gg=Gで自動整形
au FileType json setlocal equalprg=jq\ .\ --indent\ 4
" :Jq <args>でバッファ全体に対してjqを実行し、変換後の文字列で置き換え
" FIXME まだバグっていて動かない
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction

""""""""""""""""""
" lightline      "
""""""""""""""""""
" 有効にする
set laststatus=2

""""""""""""""""""
" vim-indent-guides
""""""""""""""""""
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" 色
"" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
"" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=232
"" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=233
"" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
