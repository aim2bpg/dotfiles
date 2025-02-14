" 挙動を vi 互換ではなく、Vim のデフォルト設定にする => .vimrcが存在すれば自動的に有効化されるので設定不要
" set nocompatible
" 一旦ファイルタイプ関連を無効化する => vim-plugでは不要
" filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" Gitを便利に使う
Plug 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
" Plug 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
" Plug 'KohPoll/vim-less'

" RubyMineのように自動保存する
Plug '907th/vim-auto-save'
let g:auto_save = 1

" CSVをカラム単位に色分けする
Plug 'mechatroner/rainbow_csv'

" ブロック移動の拡張
Plug 'andymass/vim-matchup'

" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利

" 2021/11/12 Added by aim2bpg Javascriptプラクティス「ESLintを使えるようにしてバグの出やすい書き方を避けられるようにする」
" 参照先：https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'
" 参照先：https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" filetypeの検出を有効化する => vim-plugでは不要
" filetype plugin indent on
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" undoファイルは作成しない
set noundofile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
" 2021/8/16 Modified by aim2bpg エラー回避 https://qiita.com/msky026/items/7d17a045c66ef120db07
if isdirectory(expand('~/.vim/bundle/vim-fugitive'))
  set statusline+=%{fugitive#statusline()}
endif
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 勝手に改行するのを防ぐ
" set textwidth=0
set formatoptions=q
" textwidthでフォーマットさせたくない
set formatoptions=q
" クラッシュ防止（http://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks）
set synmaxcol=200
" G押下時にカラム位置を保持
set nostartofline
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" markdownで => を入力したときのエラー音を無効化する
" https://twitter.com/nabe11234/status/1372425739463618561
autocmd BufRead,BufNewFile *.md set showmatch!

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

" 2021/11/12 Deleted by aim2bpg しばらく使ってみたが、合わなかった
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" 2021/11/12 Added by aim2bpg Javascriptプラクティス「ESLintを使えるようにしてバグの出やすい書き方を避けられるようにする」
""""""""""""""""""""""""""""""
" 参照先：https://standardjs.com/readme-ja.html
""""""""""""""""""""""""""""""
" 特定のLintツールのみを有効にする
""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
""""""""""""""""""""""""""""""
" 参照先：https://github.com/dense-analysis/ale
""""""""""""""""""""""""""""""
" ステータス表示プラグインのALE用設定
""""""""""""""""""""""""""""""
let g:airline#extensions#ale#enabled = 1
""""""""""""""""""""""""""""""
" エラーと警告数をステータスラインに表示する
""""""""""""""""""""""""""""""
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

set statusline=%{LinterStatus()}
""""""""""""""""""""""""""""""
" 参照先： https://wonderwall.hatenablog.com/entry/2017/03/01/223934
""""""""""""""""""""""""""""""
" 左端のシンボルカラムを表示したままにする
""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
""""""""""""""""""""""""""""""
" エラーと警告のシンボルを変更したい場合は以下のように記述する
""""""""""""""""""""""""""""""
" let g:ale_sign_error = '!!'
" let g:ale_sign_warning = '=='
""""""""""""""""""""""""""""""
" ハイライトも変更可能で、無効にしたい場合は下記設定を追加する
""""""""""""""""""""""""""""""
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
""""""""""""""""""""""""""""""
" ステータスラインで表示するフォーマットを変更したい場合は、下記設定を追加
""""""""""""""""""""""""""""""
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
""""""""""""""""""""""""""""""
" メッセージのフォーマットを変更する
""""""""""""""""""""""""""""""
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""""""""""""""""""""""""""""""
" コードチェック完了後に特定の操作を実行する
""""""""""""""""""""""""""""""
" augroup YourGroup
"     autocmd!
"     autocmd User ALELint call YourFunction()
" augroup END
""""""""""""""""""""""""""""""
" エラー間をキー操作で移動する
""""""""""""""""""""""""""""""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
""""""""""""""""""""""""""""""
" 入力中のコードチェックはやめて、ファイル保存時のみチェックする
""""""""""""""""""""""""""""""
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
""""""""""""""""""""""""""""""
" ファイルオープン時にチェックしたくない場合
""""""""""""""""""""""""""""""
" let g:ale_lint_on_enter = 0
""""""""""""""""""""""""""""""
" ロケーションリストの代わりにQuickFixを使用する
""""""""""""""""""""""""""""""
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
""""""""""""""""""""""""""""""
" エラーと警告の一覧を見るためにウィンドウを開いておく
""""""""""""""""""""""""""""""
let g:ale_open_list = 1
""""""""""""""""""""""""""""""
" エラーと警告がなくなっても開いたままにする
""""""""""""""""""""""""""""""
" let g:ale_keep_list_window_open = 1
""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

